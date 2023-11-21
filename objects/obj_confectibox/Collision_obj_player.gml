if (sprite_index != spr_confectiboxopen)
{
	with (obj_creamThief)
	{
		hsp = 0;
		vsp = 0;
		state = enemystates.idle;
		sprite_index = spr_creamthief_lose;
	}
	var _content = instance_create(x + (sprite_width / 2), y + (sprite_height / 2), BoxContent);
	if (object_get_parent(_content.object_index) == par_confecti)
	{
		with (instance_create(x + (sprite_width / 2), y + (sprite_height / 2), obj_explosioneffect))
		{
			sprite_index = spr_taunteffect;
			depth = -2;
		}
		scr_sound(sound_toppingot);
		helptimer = -1;
		if (global.toppintotal < 5)
			scr_controlprompt("[spr_promptfont]You are missing " + string(5 - global.toppintotal) + " confecti!", -4, 200);
		if (global.toppintotal == 5)
			scr_controlprompt("[spr_promptfont]You have found all 5 confecti!", -4, 200);
			global.hasallconfecti = 1
		obj_tv.showtext = 1;
		obj_tv.alarm[0] = 200;
		global.toppintotal++;
		global.collect += 1000;
		global.combofreeze = 30;
		global.combotime = 60;
	}
	repeat (6)
		instance_create((x + 50), (y + 50), obj_cagedebris)
	audio_emitter_free(emitter);
	instance_destroy();
	ds_list_add(global.saveroom, id);
}
