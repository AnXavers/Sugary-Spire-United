function state_player_crouchslide()
{
	if (!place_meeting(x, y + 1, obj_railh) && !place_meeting(x, y + 1, obj_railh2))
		hsp = xscale * movespeed;
	else if (place_meeting(x, y + 1, obj_railh))
		hsp = (xscale * movespeed) - 5;
	else if (place_meeting(x, y + 1, obj_railh2))
		hsp = (xscale * movespeed) + 5;
	if (movespeed >= 0 && !scr_slope() && grounded)
		movespeed -= 0.2;
	mask_index = spr_crouchmask;
	if (key_sprint2 && !scr_solid(x + 27, y - 32) && !scr_solid(x - 27, y - 32) && !scr_solid(x, y - 32) && !scr_solid(x, y - 16))
	{
		switch (character)
		{
			default:
				sprite_index = spr_rollgetup;
				image_index = 0;
				mach2 = 35;
				state = states.mach2;
				if (movespeed < 10)
					movespeed = 10;
				break;
			case "N":
				sprite_index = spr_mach2;
				image_index = 0;
				state = states.mach2;
				break;
		}
	}
	if (key_jump && grounded && character == "C")
	{
		image_index = 0;
		sprite_index = spr_coneboy_slidekickjump;
		input_buffer_jump = 0;
		vsp = -8;
		movespeed += 2;
	}
	if (sprite_index == spr_coneboy_slidekickjump && animation_end())
		sprite_index = spr_coneboy_slidekickfall;
	if (movespeed <= 0 && (!scr_slope() || scr_solid(x + xscale, y, true)) && !place_meeting(x + sign(hsp), y, obj_destructibles))
	{
		state = 1;
		movespeed = 0;
		mach2 = 0;
		crouchslideAnim = 1;
		image_index = 0;
		crouchAnim = 1;
		start_running = 1;
		alarm[4] = 14;
	}
	if (scr_solid(x + xscale, y, true) && !place_meeting(x + sign(hsp), y, obj_destructibles))
	{
		state = states.crouch;
		landAnim = 0;
		crouchAnim = 1;
		image_index = 0;
		idle = 0;
	}
	var _xscale = xscale;
	if (scr_slope_ext(x, y + 1) && !scr_solid_slope(x, y + 1))
	{
		with (instance_place(x, y + 1, obj_slope))
		{
			var slope_acceleration = abs(image_yscale) / abs(image_xscale);
			if (_xscale == sign(image_xscale))
			{
				if (other.movespeed > 0)
					other.movespeed -= (0.25 * slope_acceleration);
				else
				{
					other.movespeed = 0;
					other.xscale = -sign(image_xscale);
				}
			}
			else if (_xscale == -sign(image_xscale))
			{
				if (other.movespeed < 18)
					other.movespeed += (0.25 * slope_acceleration);
			}
		}
		with (instance_place(x, y + 1, obj_slopePlatform))
		{
			slope_acceleration = abs(image_yscale) / abs(image_xscale);
			if (_xscale == sign(image_xscale))
			{
				if (other.movespeed > 0)
					other.movespeed -= (0.25 * slope_acceleration);
				else
				{
					other.movespeed = 0;
					other.xscale = -sign(image_xscale);
				}
			}
			else if (_xscale == -sign(image_xscale))
			{
				if (other.movespeed < 18)
					other.movespeed += (0.25 * slope_acceleration);
			}
		}
	}
	if (!instance_exists(obj_slidecloud) && grounded && movespeed > 5)
		instance_create(x, y, obj_slidecloud);
	image_speed = 0.35;
}
