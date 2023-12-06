if (global.panic)
{
	audio_stop_sound(obj_player.sfx_escapecollectbig);
	scr_sound(obj_player.sfx_escapecollectbig);
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
	if global.newvoicelines
		scr_sound(choose(sfx_newcollect1p, sfx_newcollect2p, sfx_newcollect3p, sfx_newcollect4p))
	instance_destroy();
}
