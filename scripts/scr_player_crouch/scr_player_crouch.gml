function state_player_crouch()
{
	move = key_left + key_right;
	if (!place_meeting(x, y + 1, obj_railh) && !place_meeting(x, y + 1, obj_railh2))
		hsp = move * movespeed;
	else if (place_meeting(x, y + 1, obj_railh))
		hsp = (move * movespeed) - 5;
	else if (place_meeting(x, y + 1, obj_railh2))
		hsp = (move * movespeed) + 5;
	mask_index = spr_crouchmask;
	turning = 0;
	if (character != "C")
		movespeed = 4;
	else
		movespeed = 0;
	if (!grounded && !key_jump)
	{
		jumpAnim = 0;
		state = 66;
		movespeed = 4;
		crouchAnim = 1;
		image_index = 0;
	}
	if (key_jump && grounded && !scr_solid(x, y - 16) && !scr_solid(x, y - 32))
	{
		scr_sound(sound_jump);
		vsp = -8;
		state = 66;
		movespeed = 4;
		image_index = 0;
		crouchAnim = 1;
		jumpAnim = 1;
	}
	if (key_shoot2 && global.treat)
	{
		if (move == 0)
			movespeed = 0;
		state = 137;
		image_index = 0;
		sprite_index = spr_player_throwDonut;
		with (instance_create(x, y + 16, obj_donutThrowable))
		{
			image_xscale = other.xscale;
			if (other.key_up)
			{
				movespeed = 7;
				vsp = -14;
			}
			else
			{
				movespeed = 8;
				vsp = -5;
			}
		}
	}
	if (grounded && !key_down && !scr_solid(x, y - 16) && !scr_solid(x, y - 32) && !key_jump)
	{
		state = 1;
		movespeed = 0;
		crouchAnim = 1;
		jumpAnim = 1;
		image_index = 0;
		mask_index = spr_player_mask;
	}
	if (crouchAnim == 0 && sprite_index != spr_coneboy_slidekick)
	{
		if (move == 0)
		{
			if (shotgunAnim == 0)
				sprite_index = spr_crouch;
			else
				sprite_index = spr_shotgun_duck;
		}
		if (move != 0)
			sprite_index = spr_crawl;
	}
	if (crouchAnim == 1 && sprite_index != spr_coneboy_slidekick)
	{
		if (move == 0)
		{
			if (shotgunAnim == 0)
				sprite_index = spr_couchstart;
			else
				sprite_index = spr_shotgun_goduck;
			if (floor(image_index) == (image_number - 1))
				crouchAnim = 0;
		}
	}
	if (move != 0)
	{
		xscale = move;
		crouchAnim = 0;
	}
	if (key_taunt2 && !scr_solid(x, y - 16) && !scr_solid(x, y - 32))
	{
		taunttimer = 20;
		scr_taunt_storeVariables();
		state = 45;
		if (supertauntcharged == 1 && key_up)
		{
			image_index = 0;
			sprite_index = choose(spr_supertaunt1, spr_supertaunt2, spr_supertaunt3);
		}
		else
		{
			image_index = irandom_range(0, sprite_get_number(spr_player_taunt));
			sprite_index = spr_player_taunt;
		}
		instance_create(x, y, obj_taunteffect);
	}
	if (key_slap2 && grounded)
	{
		if (character == "C")
		{
			grav = 0.5;
			machhitAnim = 0;
			state = 67;
			movespeed = 7;
			sprite_index = spr_coneboy_slidekick;
			if (audio_is_playing(sound_suplex1))
				audio_stop_sound(sound_suplex1);
		}
		else
		{
			scr_sound(sound_suplex1);
			suplexmove = 1;
			vsp = 0;
			instance_create(x, y, obj_jumpdust);
			grav = 0.5;
			sprite_index = spr_crouchslip;
			machhitAnim = 0;
			state = 31;
			with (instance_create(x, y, obj_jumpdust))
				image_xscale = other.xscale;
			movespeed = 12;
			crouchslipbuffer = 25;
		}
	}
	image_speed = 0.3;
}
