flags.do_once_per_save = true;
output = function()
{
	var _bg = layer_background_get_id_fixed("Backgrounds_far");
	layer_change_background(506, 1317);
	layer_background_index(_bg, 0);
};
condition = function()
{
	return audio_sound_get_track_position(global.music) >= 8.15 && obj_music.music == 53;
};
