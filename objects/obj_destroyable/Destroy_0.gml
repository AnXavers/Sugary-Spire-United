if (ds_list_find_index(global.saveroom, id) == -1)
{
	repeat(4)
		instance_create(x + 16, y, obj_debris);
	audio_stop_sound(sound_destroyblock1);
	audio_stop_sound(sfx_destroyblock2);
	scr_sound(choose(sound_destroyblock1, sfx_destroyblock2));
	ds_list_add(global.saveroom, id);
}
