function state_player_jump()
{
	move = key_left + key_right;
	if (momemtum == 0)
		hsp = move * movespeed;
	else
		hsp = xscale * movespeed;
	if (move != xscale && momemtum == 1 && movespeed != 0)
		movespeed = approach(movespeed, 0, 0.1);
	if (movespeed <= 0)
		momemtum = 0;
	if ((move == 0 && momemtum == 0) || scr_solid(x + hsp, y))
	{
		movespeed = 0;
		mach2 = 0;
	}
	if (move != 0 && movespeed < 7)
		movespeed += 0.5;
	if (movespeed > 7)
		movespeed -= 0.1;
	if ((scr_solid(x + 1, y) && move == 1) || (scr_solid(x - 1, y) && move == -1))
		movespeed = 0;
	if (dir != xscale)
	{
		mach2 = 0;
		dir = xscale;
		movespeed = 0;
	}
	if (move == -xscale)
	{
		mach2 = 0;
		movespeed = 0;
		momemtum = 0;
	}
	landAnim = 1;
	if (!key_jump2 && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
	{
		vsp /= 20;
		jumpstop = 1;
	}
	if (ladderbuffer > 0)
		ladderbuffer--;
	if (scr_solid(x, y - 1) && jumpstop == 0 && jumpAnim == 1)
	{
		vsp = grav;
		jumpstop = 1;
	}
	if (grounded && input_buffer_jump < 8 && !key_down && !key_attack && vsp > 0 && !(sprite_index == spr_player_facestomp || sprite_index == spr_player_freefall))
	{
		scr_sound(sound_jump);
		sprite_index = spr_jump;
		if (shotgunAnim == 1)
			sprite_index = spr_shotgun_jump;
		instance_create_depth(x, y, -6, obj_highjumpcloud2);
		stompAnim = 0;
		vsp = -11;
		state = 60;
		jumpAnim = 1;
		jumpstop = 0;
		image_index = 0;
		freefallstart = 0;
		instance_create_depth(x, y, 0, obj_landcloud);
	}
	if (key_attack && character == "N" && charged)
	{
		sprite_index = spr_pizzano_sjumpprepside;
		image_index = 0;
		movespeed = 0;
		mach2 = 0;
		charged = 0;
		state = 104;
	}
	if (key_up && character == "N" && charged)
	{
		alarm[0] = 240;
		sprite_index = spr_pizzano_sjumpprep;
		image_index = 0;
		movespeed = 0;
		mach2 = 0;
		state = 63;
	}
	if (key_attack && grounded && fallinganimation < 40 && character == "DEEZNUTS")
	{
		mach2 = 0;
		movespeed = 0;
		sprite_index = spr_null;
		jumpAnim = 1;
		state = 105;
		image_index = 0;
	}
	if (grounded && vsp > 0 && !key_attack)
	{
		if (key_attack)
			landAnim = 0;
		input_buffer_secondjump = 0;
		state = 1;
		jumpAnim = 1;
		jumpstop = 0;
		image_index = 0;
		freefallstart = 0;
		instance_create_depth(x, y, 0, obj_landcloud);
		scr_sound(sound_step);
		doublejumped = 0;
	}
	if (key_jump)
		input_buffer_jump = 0;
	if (character == "P")
	{
		if (vsp > 5)
			fallinganimation++;
		if ((fallinganimation >= 40 && fallinganimation < 80) && sprite_index != spr_player_candyup)
			sprite_index = spr_player_freefall;
		if ((fallinganimation >= 40 && fallinganimation < 80) && sprite_index == spr_player_candyup)
		{
			sprite_index = spr_player_freefall;
			if (!instance_exists(obj_candifiedeffect1))
				instance_create(x, y, obj_candifiedeffect1);
		}
		if (fallinganimation >= 80)
			sprite_index = spr_player_freefall2;
	}
	if (stompAnim == 0)
	{
		if (jumpAnim == 1)
		{
			if (floor(image_index) == (image_number - 1))
				jumpAnim = 0;
		}
		if (jumpAnim == 0)
		{
			if (sprite_index == spr_airdash1)
				sprite_index = spr_airdash2;
			if (sprite_index == spr_player_suplexdashCancel)
				sprite_index = spr_fall;
			if (sprite_index == spr_jump)
				sprite_index = spr_fall;
		}
	}
	if (stompAnim == 1)
	{
		if (sprite_index == spr_stompprep && floor(image_index) == (image_number - 1))
			sprite_index = spr_stomp;
	}
	if (move != 0)
		xscale = move;
	image_speed = 0.35;
	if (key_shoot2 && global.treat)
	{
		vsp = -5;
		state = 137;
		image_index = 0;
		sprite_index = spr_player_throwDonut;
		with (instance_create(x, y + 16, obj_donutThrowable))
		{
			image_xscale = other.xscale;
			if (other.key_up)
			{
				movespeed = 8;
				vsp = -5;
			}
			else
			{
				movespeed = 9;
				vsp = 5;
			}
		}
	}
	do_grab();
	if (grounded && (sprite_index == spr_player_facestomp || sprite_index == spr_player_freefall || sprite_index == spr_player_freefall2))
	{
		scr_sound(sound_maximumspeedland);
		with (obj_baddie)
		{
			if (bbox_in_camera(view_camera[0]) && grounded)
			{
				vsp = -7;
				hsp = 0;
			}
		}
		with (obj_camera)
		{
			shake_mag = 10;
			shake_mag_acc = 30 / room_speed;
		}
		image_index = 0;
		sprite_index = spr_player_freefallland;
		state = 75;
		doublejumped = 0;
	}
	do_taunt();
	if (key_down2)
	{
		image_index = 0;
		sprite_index = spr_bodyslamstart;
		vsp = -6;
		if (global.treat)
		{
			vsp = -10;
			sprite_index = spr_player_donutSlam_intro;
			instance_create(x, y, obj_donutSlammable);
		}
		state = 53;
		if (character == "N")
			vsp = 0;
	}
	if (global.cane == 1)
	{
		if (!grounded)
			canrebound = 0;
		if (key_down2)
		{
			image_index = 0;
			state = 74;
			sprite_index = spr_caneslam;
			vsp = -18;
		}
		if (!key_down && key_slap2 && suplexmove == 0 && shotgunAnim == 0)
		{
			scr_sound(sound_suplex1);
			instance_create(x, y, obj_slaphitbox);
			suplexmove = 1;
			vsp = 0;
			instance_create(x, y, obj_jumpdust);
			image_index = 0;
			sprite_index = spr_canesuplex;
			state = 17;
		}
	}
	if (sprite_index == spr_caneslam)
	{
		vsp = 17;
		if (!instance_exists(obj_mach3effect))
			instance_create(x, y - 32, obj_mach3effect);
	}
	if (key_jump && character == "G" && !grounded && gumbobpropellercooldown == 0)
	{
		state = 117;
		sprite_index = spr_gumbob_propeller_start;
		movespeed = 0;
		vsp = 0;
	}
	if (key_jump && character == "N" && !grounded && doublejumped == 0 && !scr_solid(x + xscale, y, true))
	{
		doublejumped = 1;
		vsp = -10;
		sprite_index = spr_pizzano_djump;
	}
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_candytransitionup)
		sprite_index = spr_player_candyup;
	if (character == "C" && inhalingenemy == 1 && key_slap && !grounded)
	{
		sprite_index = spr_coneboy_spitair;
		with (instance_create(x, y, obj_coneboyprojectile))
			directionthing = 1;
		inhalingenemy = false;
		vsp -= 4;
	}
	if (sprite_index == spr_coneboy_spitair)
	{
		hsp = xscale * movespeed;
		hsp = -5 * xscale;
		move = 0;
	}
	if (key_attack && grounded && fallinganimation < 40)
	{
		mach2 = 0;
		if (movespeed < 6)
			movespeed = 6;
		sprite_index = spr_mach1;
		jumpAnim = 1;
		state = 69;
		image_index = 0;
	}
}
