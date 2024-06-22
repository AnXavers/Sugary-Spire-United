if (instance_exists(obj_preinitializer))
	return;	

	
with (global.music)
{
	fmod_studio_system_set_parameter_by_name("gamefocused", (window_has_focus() || !global.unfocus))
	fmod_studio_system_set_parameter_by_name("pillardistance", pillar_dist)
	fmod_studio_event_instance_set_pitch(event_instance, pitch);
	
	if (fmod_studio_event_instance_get_description(event_instance) == fmod_studio_system_get_event(mu_escape))
	{	
		var _panicstate = 0;
		if (global.laps < 2)
			_panicstate = (global.minutes <= 0)
		else
			_panicstate = global.laps;
			
		fmod_studio_event_instance_set_parameter_by_name(event_instance, "state", _panicstate)
	}
	
	if (!instance_exists(obj_gummyharry))
	{
		pillar_dist = 10;
		return;
	}
	
	with (obj_gummyharry)
	{
		var _mu = global.music;
		if (bbox_in_camera(view_camera[0], 0))
			_mu.pillar_dist = distance_to_point(obj_player.x, obj_player.y) / 80
		else
			_mu.pillar_dist = 10;
	}
}