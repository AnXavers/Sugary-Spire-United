secret = instance_exists(obj_secretfound);
var room_sng = ds_map_find_value(music_map, room);

with (global.music)
{
	fmod_studio_event_instance_set_paused(event_instance, other.secret);
	fmod_studio_event_instance_set_paused(secret_event_instance, !other.secret);
	
	if (instance_exists(obj_gummyharry) && !global.panic)
	{
		fmod_studio_event_instance_kill(pillar_instance);
		pillar_instance = fmod_studio_event_description_create_instance(fmod_studio_system_get_event(mu_nearpatrick));
		fmod_studio_event_instance_start(pillar_instance);
	}
	else
		fmod_studio_event_instance_kill(pillar_instance);
}

if (global.panic || is_undefined(room_sng))
	return;
	
change_music(music_map[? room].music, music_map[? room].secret_music, true, music_map[? room].func);