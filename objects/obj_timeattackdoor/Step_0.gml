with (obj_player)
{
	if ((place_meeting(x, y, other.id) && key_up && grounded == 1 && (state == 1 || state == 64 || state == 68 || state == 69 || state == 70) && !instance_exists(obj_fadeout) && state != 77 && state != 61 && state != 62) && other.enterable)
	{
		mach2 = 0;
		image_index = 0;
		obj_camera.chargecamera = 0;
		targetDoor = other.targetDoor;
		targetRoom = other.targetRoom;
		state = 77;
		global.roomsave = 0;
		if (other.ResetSaveroom == 1)
		{
			global.collect = 0;
			ds_list_clear(global.saveroom);
			ds_list_clear(global.baddieroom);
		}
		global.minutes++;
		global.collect += 1000;
	}
}
if (enterable)
	sprite_index = spr_doorvisited;
else
	sprite_index = spr_doorblocked;
if (global.panic && global.lapmusic && global.janitortype == 2)
	enterable = 1;
