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
	if (grounded && sprite_index != spr_crouchslip && movespeed <= 11.99)
		sprite_index = spr_machroll;
		else if (grounded && sprite_index != spr_crouchslip && movespeed >= 11.99 && sprite_index != spr_mach3roll)
		sprite_index = spr_mach3rollstart
	else if (sprite_index != spr_dive && sprite_index != spr_crouchslip && (!grounded))
	{
		sprite_index = spr_dive;
		vsp = 10;
	}

	if (crouchslipbuffer > 0)
		crouchslipbuffer--;

			if floor(image_index) == (image_number - 1) && sprite_index == spr_mach3rollstart
			sprite_index = spr_mach3roll
	if (!key_down && !scr_solid(x + 27, y - 32) && !scr_solid(x - 27, y - 32) && !scr_solid(x, y - 32) && !scr_solid(x, y - 16))
	{
		if (crouchslipbuffer <= 0)
		{
			if (key_sprint && character != "PT")
			{
				scr_sound(sound_rollgetup);
				image_index = 0;
				sprite_index = spr_rollgetup;
				if (movespeed >= 12)
					state = states.mach3;
				else
					state = states.mach2;
			}
			else if (movespeed > 6 && character != "PT")
			{
				scr_sound(sound_break);
				sprite_index = spr_machslidestart;
				image_index = 0;
				state = states.machslide;
			}
				else if (key_sprint && character == "PT")
			{
				scr_sound(sound_rollgetup);
				image_index = 0;
				vsp = -12
				pogospeed = 14
				sprite_index = spr_noise_pogostart;
					state = states.pogo;
			}
			else
				state = 1;
		}
	}
	if (key_jump && character == "N" && grounded)
	{
		sprite_index = spr_twirl;
		state = states.pizzano_twirl;
		vsp = -12;
	}
	if (key_jump && sprite_index == spr_dive)
	{
		image_index = 0;
		state = states.freefallprep;
		sprite_index = spr_pizzelle_bodyslamstart;
		vsp = -6;
		if (global.treat)
		{
			vsp = -10;
			sprite_index = spr_donutSlam_intro;
			instance_create(x, y, obj_donutSlammable);
		}
	}
	if (scr_solid(x + xscale, y, true) && !place_meeting(x + xscale, y, obj_destructibles) && !(place_meeting(x + xscale, y, obj_metalblock) && sprite_index != spr_crouchslip && movespeed >= 12))
	{
		state = states.bump;
		image_index = 0;
		sprite_index = spr_splat;
	}
		if ((!instance_exists(obj_chargeeffectsmall)) &&  sprite_index != spr_dive && sprite_index != spr_crouchslip && character == "P" && global.newplayeranim = 1)
		{
			instance_create(x, y, obj_chargeeffectsmall, 
			{
				playerID: id
			}
)
		}
	image_speed = 0.8;
}
