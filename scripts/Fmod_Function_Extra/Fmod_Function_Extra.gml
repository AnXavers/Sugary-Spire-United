// By Shaggy
//Extra functions by Shaggy

function fmod_studio_event_instance_move(_event_instance_ref, _xx = x, _yy = y)
{
	var _attributes = {
		position: {x: _xx, y: _yy, z: 0},
		velocity: {x: 0, y: 0, z: 0},
		forward: {x:0,y:0,z:1.0},
		up: {x:0,y:1.0,z:0},
	}
	
	
	fmod_studio_event_instance_set_3d_attributes(_event_instance_ref, _attributes)
}

function fmod_studio_event_oneshot(_event_path, _volume = global.option_sfx_volume * global.option_master_volume)
{
	var _oneshot_instance = fmod_studio_event_description_create_instance(fmod_studio_system_get_event(_event_path));
	fmod_studio_event_instance_move(_oneshot_instance, CAM_X + (CAM_WIDTH / 2), CAM_Y + (CAM_HEIGHT / 2))
	fmod_studio_event_instance_set_volume(_oneshot_instance, 1)
	
	fmod_studio_event_instance_start(_oneshot_instance);
	fmod_studio_event_instance_release(_oneshot_instance);
}

function fmod_studio_event_oneshot_3d(_event_path, _x = x, _y = y, _volume = global.option_master_volume * global.option_sfx_volume)
{

	var _oneshot_instance = fmod_studio_event_description_create_instance(fmod_studio_system_get_event(_event_path));
	fmod_studio_event_instance_move(_oneshot_instance, _x, _y)
	fmod_studio_event_instance_set_volume(_oneshot_instance, 1)

	fmod_studio_event_instance_start(_oneshot_instance);
	fmod_studio_event_instance_release(_oneshot_instance);
}

function fmod_studio_event_instance_kill(_event_instance_ref)
{
	fmod_studio_event_instance_stop(_event_instance_ref, FMOD_STUDIO_STOP_MODE.IMMEDIATE);
	fmod_studio_event_instance_release(_event_instance_ref);
}


function fmod_studio_event_instance_is_playing(_event_instance_ref) // Quick shortcut
{
	return (fmod_studio_event_instance_get_playback_state(_event_instance_ref) == FMOD_STUDIO_PLAYBACK_STATE.PLAYING)
}