with (obj_player)
{
	if ((place_meeting(x, y, other.id) && key_up && grounded == 1 && (state == states.normal || state == states.Sjumpprep || state == states.mach1 || state == states.mach2 || state == states.mach3) && !instance_exists(obj_fadeout) && state != states.door && state != states.victory && state != states.comingoutdoor) && other.enterable)
	{
		mach2 = 0;
		image_index = 0;
		obj_camera.chargecamera = 0;
		targetDoor = other.targetDoor;
		targetRoom = other.targetRoom;
		state = states.door;
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
