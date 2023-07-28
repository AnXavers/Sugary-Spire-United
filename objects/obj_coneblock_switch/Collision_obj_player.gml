if (delay == 0)
{
	if (global.coneblock == 0)
	{
		audio_stop_sound(sound_coneswitch1);
		audio_stop_sound(sound_coneswitch2);
		scr_sound(sound_coneswitch1);
		sprite_index = spr_coneswitch_transtoON;
		global.coneblock = true;
		if (instance_exists(obj_coneblock_on))
			obj_coneblock_on.alarm[0] = 1;
		if (instance_exists(obj_coneblock_off))
			obj_coneblock_off.alarm[0] = 1;
	}
	else
	{
		audio_stop_sound(sound_coneswitch1);
		audio_stop_sound(sound_coneswitch2);
		scr_sound(sound_coneswitch2);
		sprite_index = spr_coneswitch_transtoOFF;
		global.coneblock = false;
		if (instance_exists(obj_coneblock_on))
			obj_coneblock_on.alarm[1] = 1;
		if (instance_exists(obj_coneblock_off))
			obj_coneblock_off.alarm[1] = 1;
	}
	delay = 1;
	alarm[0] = 90;
}
