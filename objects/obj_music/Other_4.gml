var cur_stuff = ds_map_find_value(global.music_map, room);
if (!is_undefined(cur_stuff))
	room_details = cur_stuff;
if (!global.panic && room != rank_room && room != timesuproom && !instance_exists(obj_endlevelfade))
{
	var _new_song = room_details.music;
	if (!is_undefined(room_details.my_func))
		_new_song = room_details.my_func();
	normalmusic = _new_song
	if ds_map_exists(global.musicreplace, _new_song)
		_new_song = ds_map_find_value(global.musicreplace, _new_song);
	if (music != _new_song)
	{
		music = _new_song;
		prevmuID = global.music;
		var cur_mus_pos = audio_sound_get_track_position(prevmuID) / audio_sound_length(prevmuID);
		global.music = scr_music(music);
		var set_mus_pos = cur_mus_pos * audio_sound_length(global.music);
		if (room_details.continuous)
			audio_sound_set_track_position(global.music, set_mus_pos);
		if (audio_is_playing(prevmuID))
		{
			audio_sound_gain(prevmuID, 0, 500);
			audio_sound_gain(global.music, 0, 0);
			audio_sound_gain(global.music, global.musicVolume * global.VolumeModifier, 500);
		}
		else
			audio_sound_gain(global.music, global.musicVolume * global.VolumeModifier, 0);
		audio_stop_sound(global.secretmusic);
		audio_stop_sound(global.harrymusic);
		global.secretmusic = -4;
	}
	if (instance_exists(obj_gummyharry))
	{
		global.harrymusic = scr_music(mu_gummyharry);
		audio_sound_gain(global.harrymusic * global.VolumeModifier, 0, 0);
	}
}
trace(global.secret_room);
if (global.secret_room == 1 && global.levelname != "secrets")
{
	if (global.panic && global.levelname != "sucrose" && global.levelname != "finale")
		global.secretmusic = scr_music(mu_escapesecret)
	else
		global.secretmusic = scr_music(room_details.secret_music);
	var cur_pos = audio_sound_get_track_position(global.music) / audio_sound_length(global.music);
	var set_secret_pos = cur_pos * audio_sound_length(global.secretmusic);
	audio_sound_set_track_position(global.secretmusic, set_secret_pos);
	audio_pause_sound(global.music);
	global.secret_room = 2;
}
else if (global.secret_room == 2 && global.levelname != "secrets")
{
	global.secret_room = false;
	audio_resume_sound(global.music);
	audio_stop_sound(global.secretmusic);
}
if (room == rank_room)
{
	audio_stop_sound(global.music);
	audio_stop_sound(prevmuID);
	audio_stop_sound(global.secretmusic);
	audio_stop_sound(global.harrymusic);
	global.music = -4;
	global.secretmusic = -4;
	global.harrymusic = -4;
}
