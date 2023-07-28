function scr_enemy_walk()
{
	var _movespeed = grounded ? (movespeed + (clamp(global.stylethreshold, 0, 3.25) * sign(movespeed))) : 0;
	if (grounded)
	{
		if (!place_meeting(x, y + 1, obj_railh) && !place_meeting(x, y + 1, obj_railh2))
			hsp = image_xscale * _movespeed;
		else if (place_meeting(x, y + 1, obj_railh))
			hsp = (image_xscale * _movespeed) - 5;
		else if (place_meeting(x, y + 1, obj_railh2))
			hsp = (image_xscale * _movespeed) + 5;
	}
	else
		hsp = 0;
	image_speed = 0.35 + (global.stylethreshold * 0.05);
	if (grounded && sprite_index != spr_minippcnland && sprite_index != spr_minippcnspawn)
		sprite_index = walkspr;
	if (scr_solid(x + image_xscale, y, true))
	{
		if (object_index == obj_knight)
		{
			state = 2;
			hsp = 0;
		}
		else
		{
			image_xscale *= -1;
			hsp = 0;
		}
	}
	with (instance_place(x + sign(image_xscale), y, obj_hallway))
	{
		var backtoroom = -sign(image_xscale);
		if (sign(other.image_xscale) != backtoroom)
		{
			with (other.id)
			{
				if (object_index == obj_knight)
				{
					state = 2;
					hsp = 0;
				}
				else
				{
					image_xscale *= -1;
					hsp = 0;
				}
			}
		}
	}
	var _bbox_side = (image_xscale >= 1) ? bbox_right : bbox_left;
	if (!scr_solid(_bbox_side + image_xscale, y + 31) && !scr_slopePlatform(_bbox_side + image_xscale, y + 31))
	{
		if (grounded && movespeed > 0)
		{
			if (object_index == obj_knight)
			{
				state = 2;
				hsp = 0;
			}
			else if (object_index == obj_sluggy && (scr_solid(_bbox_side + image_xscale, y + 32) || scr_solid(_bbox_side + image_xscale, y + 64) || scr_solid(_bbox_side + image_xscale, y + 79)))
				vsp = -3;
			else
			{
				image_xscale *= -1;
				hsp = 0;
			}
		}
	}
	if (!grounded && object_index == obj_minipopcorn)
		sprite_index = spr_minippcnspawn;
	if (grounded && sprite_index == spr_minippcnspawn)
	{
		sprite_index = spr_minippcnland;
		image_index = 0;
	}
	if (animation_end() && sprite_index == spr_minippcnland)
		sprite_index = walkspr;
}
