with (obj_player)
{
	if (place_meeting(x, y, other.id) && key_up && grounded == 1 && (state == states.normal || state == states.Sjumpprep || state == states.mach1 || state == states.mach2 || state == states.mach3) && !instance_exists(obj_fadeout) && state != 77 && state != 61 && state != 62)
	{
		if (ds_list_find_index(global.saveroom, other.id) != -1)
		{
			mach2 = 0;
			image_index = 0;
			obj_camera.chargecamera = 0;
			targetDoor = other.targetDoor;
			targetRoom = other.targetRoom;
			state = states.door;
			global.roomsave = 0;
		}
		else if (global.janitorRudefollow)
		{
			scr_sound(sound_unlockingdoor);
			state = 61;
			image_index = 0;
			obj_camera.chargecamera = 0;
			targetDoor = other.targetDoor;
			targetRoom = other.targetRoom;
			with (other)
			{
				ds_list_add(global.saveroom, id);
				image_index = 0;
				sprite_index = spr_worlddoor_open;
				image_speed = 0.35;
			}
			instance_create(x, y, obj_lock);
			global.roomsave = 0;
		}
	}
}
