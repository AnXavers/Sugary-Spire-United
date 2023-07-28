switch (state)
{
	case 1:
		hsp = movespeed * image_xscale;
		if (grounded)
		{
			if (distance_to_point(obj_player.x, y) > 700 && rubberband < 3 && ((obj_player.x <= x && image_xscale <= -1) || (obj_player.x >= x && image_xscale >= 1)))
			{
				if (!audio_is_playing(sound_train))
					scr_sound(sound_train);
				rubberband = 3;
			}
			else
				rubberband = 0;
			movespeed = approach(movespeed, 14 + rubberband, 0.5);
		}
		if (place_meeting(x + hsp, y, obj_metalblock) || place_meeting(x + sign(image_xscale), y, obj_metalblock))
		{
			with (instance_place(x + hsp, y, obj_metalblock))
				instance_destroy();
			with (instance_place(x + sign(image_xscale), y, obj_metalblock))
				instance_destroy();
		}
		if (place_meeting(x + hsp, y, obj_metalblockHARD) || place_meeting(x + sign(image_xscale), y, obj_metalblockHARD))
		{
			with (instance_place(x + hsp, y, obj_metalblockHARD))
				instance_destroy();
			with (instance_place(x + sign(image_xscale), y, obj_metalblockHARD))
				instance_destroy();
		}
		break;
	case 0:
		hsp = 0;
		movespeed = 10;
		sprite_index = spr_spray;
		break;
	case 2:
		hsp = movespeed * -image_xscale;
		movespeed = approach(movespeed, 0, 0.4);
		if (animation_end())
		{
			image_index = 0;
			sprite_index = spr_spray;
			movespeed = 10;
			state = 1;
		}
		break;
}
if (animation_end() && sprite_index == spr_spraydie)
	event_user(0);
if (animation_end() && sprite_index == spr_sprayjump)
	sprite_index = spr_sprayfall;
if (sprite_index == spr_sprayfall && grounded)
	sprite_index = spr_sprayland;
if (animation_end() && sprite_index == spr_sprayland)
	sprite_index = spr_spray;
if (y > (room_height + 64) && sprite_index != spr_spraydie)
{
	x = xstart;
	y = ystart;
	image_index = 0;
	sprite_index = spr_spray;
	state = 0;
}
