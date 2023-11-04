flags.do_once_per_save = true;
output = function()
{
	var _bg = layer_background_get_id_fixed("Backgrounds_far");
	layer_change_background(bg_sucrose_skySleep, bg_sucrose_skyWakingUp);
	layer_background_index(_bg, 0);
};
condition = function()
{
	return audio_sound_get_track_position(global.music) >= 8.15;
};
