if (ds_list_find_index(global.saveroom, id) == -1)
{
	with (instance_create(x + (32 * image_xscale), y + (32 * image_yscale), obj_baddieDead))
		sprite_index = spr_milkblock_dead;
	with (obj_camera)
	{
		shake_mag = 20;
		shake_mag_acc = 40 / room_speed;
	}
	audio_stop_sound(sound_killingblow);
	scr_sound(sound_killingblow);
	ds_list_add(global.saveroom, id);
}
