if (secretActivated && !place_meeting(x, y, obj_secretPortalexit))
{
	if (other.state != 110 && sprite_index == spr_secretPortal && ds_list_find_index(global.saveroom, id) == -1)
	{
		var _cutscene = cutscene_create([cutscene_secretPortal_start, cutscene_secretPortal_middle, cutscene_secretPortal_preend, cutscene_secretPortal_end]);
		cutscene_declare_actor(id, "SECRETPORTAL");
		if (is_undefined(storedState))
			storedState = functionState();
		with (_cutscene)
			storedState = other.storedState;
		image_index = 0;
		sprite_index = spr_secretPortal_tele;
		scr_sound(sfx_secretportalenter);
		ds_list_add(global.saveroom, id);
	}
}
