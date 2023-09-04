hsp = image_xscale * movespeed;
if (afterimagebuffer > 0)
	afterimagebuffer--;
squishscale = approach(squishscale, 1, 0.1);
if ((scr_solid(x + sign(hsp), y) && !(scr_slope() && !scr_solid(x + sign(hsp), y - 2)) && !place_meeting(x + hsp, y, obj_destructibles)) || movespeed <= 0 || distance_to_object(obj_player) > 500)
{
}
if (afterimagebuffer <= 0)
{
	with (instance_create(x, y, obj_cotton_aftereffect))
	{
		image_index = other.image_index - 1;
		image_xscale = other.image_xscale;
		sprite_index = other.sprite_index;
	}
	afterimagebuffer = 4;
}
if (scr_slope() && vsp >= 0)
{
	if (place_meeting(x, y + 1, obj_slope))
	{
		with (instance_place(x, y + 1, obj_slope))
		{
			var slope_acceleration = abs(image_yscale) / abs(image_xscale);
			if (other.image_xscale == sign(image_xscale))
			{
				if (other.movespeed > 0)
					other.movespeed -= (0.25 * slope_acceleration);
				if (other.movespeed <= 0)
					other.image_xscale = -sign(image_xscale);
			}
			else if (other.movespeed < 20 && other.image_xscale == -sign(image_xscale))
				other.movespeed += (0.25 * slope_acceleration);
		}
	}
	if (place_meeting(x, y + 1, obj_slopePlatform))
	{
		with (instance_place(x, y + 1, obj_slopePlatform))
		{
			slope_acceleration = abs(image_yscale) / abs(image_xscale);
			if (other.image_xscale == sign(image_xscale))
			{
				if (other.movespeed > 0)
					other.movespeed -= (0.25 * slope_acceleration);
				if (other.movespeed <= 0)
					other.image_xscale = -sign(image_xscale);
			}
			else if (other.movespeed < 20 && other.image_xscale == -sign(image_xscale))
				other.movespeed += (0.25 * slope_acceleration);
		}
	}
}
scr_collide_conehead();
if (place_meeting(x + hsp, y + vsp, obj_destructibles))
{
	with (instance_place(x + hsp, y + vsp, obj_destructibles))
	{
		DestroyedBy = other.id;
		event_user(0);
	}
}
if (grounded && movespeed > 0)
	movespeed -= 0.5;
