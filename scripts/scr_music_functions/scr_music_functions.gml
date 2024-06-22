function music_set_paused(_pause)
{
	var _truepause = {
		main_music: (_pause) ? _pause : obj_music.secret,
		secret_music: (_pause) ? _pause : !obj_music.secret
	}
	
	with (global.music)
	{
		fmod_studio_event_instance_set_paused(event_instance, _truepause.main_music)
		fmod_studio_event_instance_set_paused(secret_event_instance, _truepause.secret_music)
		fmod_studio_event_instance_set_paused(pillar_instance, _pause)
	}
}

function music_set_volume(_volume)
{
	with (global.music)
	{
		fmod_studio_event_instance_set_volume(event_instance, _volume)
		fmod_studio_event_instance_set_volume(secret_event_instance, _volume)
		fmod_studio_event_instance_set_volume(pillar_instance, _volume)
	}
}


function change_music(_music, _secretmusic, _continuous = false, _method = function() { fmod_studio_event_instance_set_parameter_by_name(global.music.event_instance, "state", 0) })
{
	with (global.music)
	{
		if (_music != noone && (fmod_studio_event_instance_get_description(event_instance) != fmod_studio_system_get_event(_music) || !_continuous))
		{
			fmod_studio_event_instance_kill(event_instance);
			event_instance = fmod_studio_event_description_create_instance(fmod_studio_system_get_event(_music));
			fmod_studio_event_instance_start(event_instance);
		}
		
		if (_secretmusic != noone && (fmod_studio_event_instance_get_description(secret_event_instance) != fmod_studio_system_get_event(_secretmusic) || !_continuous))
		{
			fmod_studio_event_instance_kill(secret_event_instance);
			secret_event_instance = fmod_studio_event_description_create_instance(fmod_studio_system_get_event(_secretmusic));
			fmod_studio_event_instance_start(secret_event_instance);	
		}
		
		fmod_studio_event_instance_set_paused(event_instance, obj_music.secret);
		fmod_studio_event_instance_set_paused(secret_event_instance, !obj_music.secret);
	}
	
	_method();
}

function add_music(_room, _music, _secret_music, _method = function() {	fmod_studio_event_instance_set_parameter_by_name(global.music.event_instance, "state", 0) })
{
	var _data = {
		rm: _room,
		music: _music,
		secret_music: _secret_music,
		func: _method
	}
	
	if (is_array(_data.rm))
	{
		for (var i = 0; i < array_length(_data.rm); i++)
			ds_map_add(obj_music.music_map, _data.rm[i], _data)
	}
	else
		ds_map_add(obj_music.music_map, _data.rm, _data)
}

function restart_music()
{
	with (global.music)
	{
	    fmod_studio_event_instance_start(event_instance);
	    fmod_studio_event_instance_start(secret_event_instance);	
	    
	    fmod_studio_event_instance_set_paused(event_instance, obj_music.secret);
	    fmod_studio_event_instance_set_paused(secret_event_instance, !obj_music.secret);
	}
}

function stop_music(_mode)
{
	with (global.music)
	{
		fmod_studio_event_instance_stop(event_instance, _mode)
		fmod_studio_event_instance_stop(secret_event_instance, _mode)
	}
}