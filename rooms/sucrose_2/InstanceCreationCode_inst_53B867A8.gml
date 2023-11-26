flags.do_once_per_save = true;
output = function()
{
	global.panic = true;
	if global.escapetimer != 1
		obj_tv.sucroseTimer = true;
	var time_array = scr_escapetimes();
	global.fill = time_in_frames(time_array[0], time_array[1]);
	obj_tv.target_fill = global.fill;
	obj_tv.timer_in = 0;
	obj_tv.timer_y = 80;
	global.wave = 0;
	global.maxwave = global.fill;
	instance_create(x, y, obj_panicchanger);
};
condition = function()
{
	var _bg = layer_background_get_id_fixed("Backgrounds_far");
	var _bg_sprite = layer_background_get_sprite(_bg);
	return audio_sound_get_track_position(global.music) >= 9.45 && _bg == (bg_sucrose_skySleep || bg_sucrose_skyWakingUp);
};
