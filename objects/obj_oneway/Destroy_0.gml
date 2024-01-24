if (ds_list_find_index(global.saveroom, id) == -1)
{
	if sprite_index != spr_onewayblock_new
	{
		repeat (7)
		{
			with (instance_create(x + (image_xscale * 32), y + 32, obj_debris))
				sprite_index = spr_bigdebris;
		}
		with (instance_create(x + (image_xscale * 64), y + 32, obj_debris))
			sprite_index = spr_bigdebrisBandage;
	}
	else
	{
		with (instance_create(x + (32 * image_xscale), y + (32 * image_yscale), obj_baddieDead))
			sprite_index = spr_onewayblock_die_new;
	}
	audio_stop_sound(sound_destroyblock1);
	audio_stop_sound(sfx_destroyblock2);
	scr_sound(choose(sound_destroyblock1, sfx_destroyblock2));
	ds_list_add(global.saveroom, id);
}
if (instance_exists(solidid))
{
	with (solidid)
		instance_destroy();
}
