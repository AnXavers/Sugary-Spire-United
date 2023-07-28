if (global.panic)
{
	audio_stop_sound(sound_bigescapeclock);
	scr_sound(sound_bigescapeclock);
	global.collect += 100;
	global.pizzameter += 5;
	scr_queue_tvanim(obj_tv.happytvspr, 50);
	create_small_number(x, y, "100");
	global.combofreeze = 30;
	global.combotime += 45;
	scr_ghostcollectible();
	repeat (5)
	{
		with (instance_create((x + random_range(-32, 32)) - 16, (y + random_range(-32, 32)) - 16, obj_collecteffect))
			sprite_index = spr_collectescape;
	}
	instance_destroy();
}
