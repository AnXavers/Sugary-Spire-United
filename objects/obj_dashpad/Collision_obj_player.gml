if (other.state == 70)
{
	with (other)
	{
		movespeed += 0.25;
		movespeed = clamp(movespeed, 12, 24);
	}
}
if (other.Dashpad_buffer <= 0)
{
	audio_stop_sound(sound_dashpad);
	scr_sound(sound_dashpad);
	with (other)
	{
		if (state != 64 && state != 22 && state != 101 && state != 65 && state != 144 && state != 145 && state != 146 && state != 83 && sprite_get_bbox_bottom(mask_index) <= other.bbox_bottom)
		{
			movespeed += 0.25;
			movespeed = clamp(movespeed, 12, 24);
			if (character == "P")
			{
				Dashpad_buffer = 25;
				state = 70;
				if (sprite_index != spr_machdashpad)
				{
					sprite_index = spr_machdashpad;
					image_index = 0;
				}
				xscale = sign(other.image_xscale);
				var try_y = 0;
				while (try_y <= 16)
				{
					if (scr_solid(x, other.y - try_y))
						try_y++;
					else
					{
						y = other.y - try_y;
						break;
					}
				}
				if (state != 11 && !scr_solid(other.x, y))
					x = other.x;
				vsp = 3;
				flash = 1;
			}
			if (character == "N")
			{
				state = 70;
				Dashpad_buffer = 25;
				xscale = sign(other.image_xscale);
				try_y = 0;
				while (try_y <= 16)
				{
					if (scr_solid(x, other.y - try_y))
						try_y++;
					else
					{
						y = other.y - try_y;
						break;
					}
				}
				image_index = 0;
				flash = 1;
			}
		}
		else if (state == 101 && sprite_get_bbox_bottom(mask_index) <= other.bbox_bottom)
		{
			xscale = sign(other.image_xscale);
			movespeed += 4;
			movespeed = clamp(movespeed, 14, 24);
			if (!scr_solid(other.x, y))
				x = other.x;
			flash = 1;
			Dashpad_buffer = 50;
			image_index = 0;
			sprite_index = spr_player_minecartfastland;
		}
		else if ((state == 144 || state == 145 || state == 146) && sprite_get_bbox_bottom(mask_index) <= other.bbox_bottom)
		{
			state = 144;
			if (!scr_solid(other.x, y))
				x = other.x;
			flash = 1;
			Dashpad_buffer = 25;
			xscale = sign(other.image_xscale);
			image_index = 0;
			movespeed = 20 * xscale;
		}
	}
}
