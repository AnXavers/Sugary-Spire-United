function scr_sound()
{
	var snd = audio_play_sound(argument[irandom(argument_count - 1)], 1, false);
	audio_sound_gain(snd, global.soundVolume, 0);
	return snd;
}
function scr_soundloop()
{
	var snd = audio_play_sound(argument[irandom(argument_count - 1)], 1, true);
	audio_sound_gain(snd, global.soundVolume, 0);
	return snd;
}
function scr_dialogue()
{
	var snd = audio_play_sound(argument[irandom(argument_count - 1)], 1, false);
	audio_sound_gain(snd, global.dialogueVolume, 0);
	return snd;
}
function scr_music(argument0, argument1 = 0, argument2 = undefined)
{
	var _snd = audio_play_sound(argument0, 10, true);
	audio_sound_gain(_snd, global.musicVolume, 0);
	return _snd;
}
function scr_musicnoloop()
{
	global.music = audio_play_sound(argument0, 10, false);
	audio_sound_gain(global.music, global.musicVolume, 0);
	return global.music;
}
function audio_stop_all_music()
{
	with (obj_music)
	{
		audio_stop_sound(global.music);
		audio_stop_sound(prevmuID);
		audio_stop_sound(global.secretmusic);
		audio_stop_sound(global.harrymusic);
		global.music = -4;
		prevmuID = -4;
		global.secretmusic = -4;
		global.harrymusic = -4;
	}
}
function force_song(argument0, argument1, argument2 = true, argument3 = 0, argument4 = undefined)
{
	with (obj_music)
	{
		room_details = 
		{
			rm: 3,
			song: argument0,
			secret_song: argument1,
			continuous: false,
			loop_begin: argument3,
			loop_end: argument4
		};
		ignore_change = true;
		hard_force = argument2;
		unforce_continuous = true;
		event_perform(7, 4);
	}
	exit;
}
function scr_get_music_loop()
{
	if (!audio_is_playing(argument0))
		return 0;
	var file = asset_get_index(audio_get_name(argument0));
	switch (file)
	{
		default:
			return 0;
			break;
		case 53:
			return 8.15;
			break;
	}
}
