with (obj_player)
{
	if (other.image_yscale == 1)
	{
		if (((key_down && !place_meeting(x, y + 1, obj_destructibles) && place_meeting(x, y + 1, other.id) && (state == 65 || state == 31)) || ((state == 67 || state == 74 || state == 75) && !place_meeting(x, y + 1, obj_destructibles) && place_meeting(x, y + 1, other.id))) && !instance_exists(obj_fadeout) && state != 77 && state != 62)
		{
			with (other)
			{
				event_user(0);
				sprite_index = spr_pizzabox_front;
				depth = -30;
			}
			scr_sound(sound_box);
			obj_player.box = 1;
			mach2 = 0;
			obj_camera.chargecamera = 0;
			x = other.x;
			obj_player.targetDoor = other.targetDoor;
			obj_player.targetRoom = other.targetRoom;
			sprite_index = spr_player_downpizzabox;
			image_index = 0;
			state = 77;
		}
	}
	if (other.image_yscale == -1)
	{
		if ((((key_up || state == 63) && !place_meeting(x, y - 1, obj_destructibles) && place_meeting(x, y - 1, other.id) && (state == 60 || state == 89 || state == 63)) && !place_meeting(x, y - 1, obj_destructibles) && place_meeting(x, y - 1, other.id)) && !instance_exists(obj_fadeout))
		{
			scr_sound(sound_box);
			with (other)
			{
				event_user(0);
				sprite_index = spr_pizzabox_front;
				depth = -30;
			}
			obj_player.box = 1;
			mach2 = 0;
			obj_camera.chargecamera = 0;
			x = other.x;
			obj_player.targetDoor = other.targetDoor;
			obj_player.targetRoom = other.targetRoom;
			sprite_index = spr_player_uppizzabox;
			image_index = 0;
			state = 77;
		}
	}
}
