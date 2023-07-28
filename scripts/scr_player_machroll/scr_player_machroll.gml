function state_player_machroll()
{
	if (!place_meeting(x, y + 1, obj_railh))
		hsp = xscale * movespeed;
	else if (place_meeting(x, y + 1, obj_railh))
		hsp = (xscale * movespeed) - 5;
	else if (place_meeting(x, y + 1, obj_railh2))
		hsp = (xscale * movespeed) + 5;
	mach2 = 100;
	machslideAnim = 1;
	move = key_right + key_left;
	if (!instance_exists(obj_cloudeffect) && grounded)
		instance_create(x, y + 43, obj_cloudeffect);
	if (grounded && sprite_index != spr_crouchslip)
		sprite_index = spr_machroll;
	else if (sprite_index != spr_dive && sprite_index != spr_crouchslip)
	{
		sprite_index = spr_dive;
		vsp = 10;
	}
	if (crouchslipbuffer > 0)
		crouchslipbuffer--;
	if (!key_down && !scr_solid(x + 27, y - 32) && !scr_solid(x - 27, y - 32) && !scr_solid(x, y - 32) && !scr_solid(x, y - 16))
	{
		if (crouchslipbuffer <= 0)
		{
			if (key_attack)
			{
				scr_sound(sound_rollgetup);
				image_index = 0;
				sprite_index = spr_rollgetup;
				if (movespeed >= 12)
					state = 70;
				else
					state = 69;
			}
			else if (movespeed > 6)
			{
				scr_sound(sound_break);
				sprite_index = spr_machslidestart;
				image_index = 0;
				state = 71;
			}
			else
				state = 1;
		}
	}
	if (key_jump && character == "N" && grounded)
	{
		sprite_index = spr_pizzano_twirl;
		state = 119;
		vsp = -12;
	}
	if (key_jump && sprite_index == spr_dive)
	{
		image_index = 0;
		state = 53;
		sprite_index = spr_bombdropstart;
		vsp = -6;
		if (global.treat)
		{
			vsp = -10;
			sprite_index = spr_player_donutSlam_intro;
			instance_create(x, y, obj_donutSlammable);
		}
	}
	if (scr_solid(x + xscale, y, true) && !place_meeting(x + xscale, y, obj_destructibles) && !(place_meeting(x + xscale, y, obj_metalblock) && sprite_index != spr_crouchslip && movespeed >= 12))
	{
		state = 72;
		image_index = 0;
		sprite_index = spr_splat;
	}
	image_speed = 0.8;
}
