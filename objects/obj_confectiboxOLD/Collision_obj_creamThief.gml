if (sprite_index != spr_confectiboxopen && other.state == 2)
{
	with (other)
	{
		sprite_index = spr_creamthief_grab;
		image_index = 0;
		state = enemystates.idle;
	}
	with (obj_creamThiefLoseTrigger)
	{
		if (ds_list_find_index(global.saveroom, id) == -1)
			ds_list_add(global.saveroom, id);
		instance_destroy();
	}
	scr_sound(sound_toppinlost);
	sprite_index = spr_confectiboxopen;
	image_index = 0;
	ds_list_add(global.saveroom, id);
}
