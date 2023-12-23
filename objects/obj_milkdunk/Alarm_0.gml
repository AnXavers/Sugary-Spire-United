if (ds_list_find_index(global.saveroom, id) == -1)
{
	audio_stop_sound(sound_points);
	scr_sound(sound_points);
	scr_sound(sfx_dunk);
	global.collect += 100;
	create_small_number(x + 64, y + 32, "100");
	repeat (5)
		instance_create((x + (64 + random_range(48, -48))), (y + (32 + random_range(48, -48))), obj_collecteffect)
	global.combotime = 60;
	instance_destroy(obj_milkblock);
	ds_list_add(global.saveroom, id);
}
sprite_index = spr_milkgoal_filled;
