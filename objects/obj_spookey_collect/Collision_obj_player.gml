if (!(ds_list_find_index(global.saveroom, id) != -1))
{
	instance_create(x, y, obj_spookey);
	global.key_inv = 1;
	with (instance_create(x, y, obj_explosioneffect))
	{
		sprite_index = spr_taunteffect;
		depth = -2;
	}
	scr_sound(sound_toppingot);
	global.combofreeze = 30;
	global.combotime = 60;
	ds_list_add(global.saveroom, id);
	instance_destroy();
	scr_queue_tvanim(obj_tv.keytvspr, 150);
}
