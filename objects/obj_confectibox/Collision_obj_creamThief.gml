if (sprite_index != spr_confectiboxopen && other.state == 2)
{
	helptimer = -1;
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
	repeat (4)
		instance_create((x + 50), (y + 50), obj_cagedebris)
	audio_emitter_free(emitter);
	instance_destroy();
	ds_list_add(global.saveroom, id);
}
