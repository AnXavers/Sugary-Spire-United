if (ds_list_find_index(global.saveroom, id) == -1)
{
	var rep = 7 + ((sprite_width / 32) - 1);
	repeat (rep)
	{
		with (instance_create(x + (sprite_width / 2), y + (sprite_height / 2), obj_debris))
			sprite_index = spr_bigdebris;
	}
	audio_stop_sound(sound_destroyblock1);
	audio_stop_sound(sfx_destroyblock2);
	scr_sound(choose(sound_destroyblock1, sfx_destroyblock2));
	ds_list_add(global.saveroom, id);
}
for (var i = 0; i < array_length(tiles); i++)
	scr_destroy_tile(tiles[i]);
scr_destroy_nearby_tiles();
