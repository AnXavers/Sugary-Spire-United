with (obj_player)
{
	if (place_meeting(x, y, other.id) && key_up && grounded == 1 && (state == 1 || state == 64 || state == 68 || state == 69 || state == 70) && !instance_exists(obj_fadeout) && state != 77 && state != 61 && state != 62)
	{
		mach2 = 0;
		image_index = 0;
		obj_camera.chargecamera = 0;
		targetDoor = other.targetDoor;
		targetRoom = other.targetRoom;
		state = 77;
		global.roomsave = 0;
		ds_list_add(global.saveroom, other.id);
		other.sprite_index = spr_doorvisited;
		if (other.ResetSaveroom == 1)
		{
			global.collect = 0;
			ds_list_clear(global.saveroom);
			ds_list_clear(global.baddieroom);
		}
		other.visited = 1;
	}
}
lightIndex += 0.35;
