if (audio_is_playing(global.music))
{
	var loop_main = scr_get_music_loop(global.music);
	if (audio_sound_get_track_position(global.music) >= (audio_sound_length(global.music) - 0.05))
		audio_sound_set_track_position(global.music, loop_main);
}
if (audio_is_playing(global.secretmusic))
{
	loop_main = scr_get_music_loop(global.secretmusic);
	if (audio_sound_get_track_position(global.secretmusic) >= (audio_sound_length(global.secretmusic) - 0.05))
		audio_sound_set_track_position(global.secretmusic, loop_main);
}
