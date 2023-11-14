with (obj_player)
{
	if (other.image_yscale == 1)
	{
		if (((key_down && !place_meeting(x, y + 1, obj_destructibles) && place_meeting(x, y + 1, other.id) && (state == states.crouch || state == states.machroll)) || ((state == states.crouchslide || state == states.freefall || state == states.freefallland) && !place_meeting(x, y + 1, obj_destructibles) && place_meeting(x, y + 1, other.id))) && !instance_exists(obj_fadeout) && state != states.door && state != states.comingoutdoor)
		{
			with (other)
			{
				event_user(0);
				sprite_index = spr_pizzabox_front;
				depth = -30;
			}
			scr_sound(sound_box);
			box = 1;
			mach2 = 0;
			obj_camera.chargecamera = 0;
			x = other.x;
			targetDoor = other.targetDoor;
			targetRoom = other.targetRoom;
			sprite_index = spr_downpizzabox;
			image_index = 0;
			state = states.door;
		}
	}
	if (other.image_yscale == -1)
	{
		if ((((key_up || state == states.Sjump) && !place_meeting(x, y - 1, obj_destructibles) && place_meeting(x, y - 1, other.id) && (state == states.jump || state == states.uppercut || state == states.Sjump)) && !place_meeting(x, y - 1, obj_destructibles) && place_meeting(x, y - 1, other.id)) && !instance_exists(obj_fadeout))
		{
			scr_sound(sound_box);
			with (other)
			{
				event_user(0);
				sprite_index = spr_pizzabox_front;
				depth = -30;
			}
			box = 1;
			mach2 = 0;
			obj_camera.chargecamera = 0;
			x = other.x;
			targetDoor = other.targetDoor;
			targetRoom = other.targetRoom;
			sprite_index = spr_uppizzabox;
			image_index = 0;
			state = states.door;
		}
	}
}
