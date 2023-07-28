if (instance_exists(obj_creamThief) && ds_list_find_index(global.saveroom, id) == -1)
{
	with (obj_creamThief)
	{
		state = 2;
		sprite_index = spr_creamthief_startRace;
		image_index = 0;
	}
	ds_list_add(global.saveroom, id);
}
