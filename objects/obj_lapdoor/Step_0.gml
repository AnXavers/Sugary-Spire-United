with (obj_player)
{
	if ((place_meeting(x, y, other.id) && key_up && grounded == 1 && (state == 1 || state == states.Sjumpprep || state == states.mach1 || state == states.mach2 || state == states.mach3) && !instance_exists(obj_fadeout) && state != states.door && state != states.victory && state != states.comingoutdoor) && global.janitortype == 1)
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
		else if (global.janitorRudefollow == 1)
		{
			scr_sound(sfx_unlockingdoor);
			state = states.victory;
			image_index = 0;
			obj_camera.chargecamera = 0;
			targetDoor = other.targetDoor;
			targetRoom = other.targetRoom;
			with (other)
			{
				ds_list_add(global.saveroom, id);
				image_index = 0;
				sprite_index = spr_lapdooropen;
				image_speed = 0.35;
			}
			instance_destroy(obj_rudejanitor);
			instance_create(x, y, obj_lock);
			global.roomsave = 0;
		}
	}
}
