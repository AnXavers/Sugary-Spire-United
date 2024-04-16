if (secretActivated && !place_meeting(x, y, obj_secretPortalexit))
{
	if (other.state != states.actor && sprite_index == spr_secretPortal && ds_list_find_index(global.saveroom, id) == -1 && (global.gamemode != 1 || global.levelname == "secrets"))
	{
		var _cutscene = cutscene_create([cutscene_secretPortal_start, cutscene_secretPortal_middle, cutscene_secretPortal_preend, cutscene_secretPortal_end]);
		cutscene_declare_actor(id, "SECRETPORTAL");
		if (is_undefined(storedState))
			storedState = obj_player.state;
		with (_cutscene)
			storedState = other.storedState;
		image_index = 0;
		sprite_index = spr_secretPortal_tele;
		scr_sound(sfx_secretportalenter);
		if (global.levelname != "none" && global.levelname != "secrets")
			ds_list_add(global.saveroom, id);
		if global.levelname == "secrets"
			array_delete(global.secretsspire, array_get_index(global.secretsspire, targetRoom), 1)
	}
	else if (other.state != states.actor && sprite_index == spr_secretPortal && ds_list_find_index(global.saveroom, id) == -1)
	{
		image_index = 0;
		sprite_index = spr_secretPortal_tele;
		scr_sound(sfx_secretportalenter);
		scr_sound(sound_secretgot);
		global.secretfound++;
		scr_queue_tvanim(obj_tv.secrettvspr, 200);
		global.collect += 500
		global.pizzameter += 5;
		create_small_number(x, y, "500");
		global.combofreeze = 10;
		global.combotime = 60;
		repeat (5)
			instance_create(((x + random_range(-60, 60)) - 16), ((y + random_range(-60, 60)) - 16), obj_collecteffect)
		with (obj_tv)
		{
			scr_controlprompt("[spr_promptfont]You have found " + string(global.secretfound) + ((global.secretfound > 1) ? " secrets out of 3!" : " secret out of 3!"), -4, 150);
			showtext = 1;
			alarm[0] = 150;
		}
		ds_list_add(global.saveroom, id);
	}
}
