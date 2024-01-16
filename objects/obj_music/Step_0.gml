pausedmusic = global.music;
var _oldGummyBear = GummyBear;
if (instance_exists(obj_gummyharry))
{
	var p = 0;
	with (obj_gummyharry)
	{
		if (bbox_in_camera(view_camera[0]))
			p = 1;
	}
	if (p != GummyBear)
		GummyBear = p;
}
else
	GummyBear = 0;
if (_oldGummyBear != GummyBear)
{
	if (GummyBear)
	{
		audio_sound_gain(global.harrymusic, global.musicVolume * global.VolumeModifier, 2000);
		audio_sound_gain(global.music, 0, 2000);
	}
	else
	{
		audio_sound_gain(global.harrymusic, 0, 2000);
		audio_sound_gain(global.music, global.musicVolume * global.VolumeModifier, 2000);
	}
}
if (audio_sound_get_gain(prevmuID) <= 0)
	audio_stop_sound(prevmuID);
if (room != timesuproom && room != rank_room && !instance_exists(obj_endlevelfade))
{
	var _new_song = -4;
	if (!is_undefined(room_details.my_func))
		_new_song = room_details.my_func();
	var unforce_cont = false;
	if (global.panic)
	{
		if global.levelname == "finale"
			_new_song = mu_finale;
		else if global.levelname == "yogurt"
			_new_song = mu_pizzelle_death;
		else if global.levelname == "sucrose"
			_new_song = mu_sucrose
		else
		{
			if (global.lapcount == 5 && global.lapmode == 2)
				_new_song = mu_lowface
			else if (global.lapcount >= 10 || (global.lapcount == 4 && global.lapmode == 2))
				_new_song = obj_player.mu_lap10song;
			else if (global.lapcount >= 5 || (global.lapcount == 3 && global.lapmode == 2))
				_new_song = obj_player.mu_lap5song;
			else if (global.lapcount >= 2)
				_new_song = obj_player.mu_lap2song;
			else 
				_new_song = obj_player.mu_escapesong;
		}
		unforce_cont = true;
	}
	if (global.gamemode == 1 && !instance_exists(obj_modifiermenu) && !instance_exists(obj_titlecard) && !instance_exists(obj_rank) && global.levelname != "none")
		_new_song = mu_getaway
	normalmusic = _new_song
	if ds_map_exists(global.musicreplace, _new_song)
		_new_song = ds_map_find_value(global.musicreplace, _new_song);
	if (_new_song != -4 && music != _new_song)
	{
		music = _new_song;
		prevmuID = global.music;
		var cur_mus_pos = audio_sound_get_track_position(prevmuID) / audio_sound_length(prevmuID);
		global.music = scr_music(music);
		var set_mus_pos = cur_mus_pos * audio_sound_length(global.music);
		if (!unforce_cont)
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
}
