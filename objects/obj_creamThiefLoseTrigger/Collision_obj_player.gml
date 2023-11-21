if (instance_exists(obj_creamThief) && ds_list_find_index(global.saveroom, id) == -1)
{
	with (obj_creamThief)
	{
		hsp = 0;
		vsp = 0;
		state = enemystates.idle;
		sprite_index = spr_creamthief_lose;
	}
}
