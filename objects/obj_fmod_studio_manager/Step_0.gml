fmod_studio_system_update();

//More listener brainrot
listener_attributes.position.x =  camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0]) / 2);
listener_attributes.position.y = camera_get_view_y(view_camera[0]) + (camera_get_view_height(view_camera[0]) / 2);

fmod_studio_system_set_listener_attributes(0, listener_attributes);
fmod_studio_system_set_listener_weight(0, listener_weight);

// Volumes
var _sfxvol = (global.masterVolume * global.soundVolume)
var _musvol = (global.masterVolume * global.musicVolume)

fmod_studio_bus_set_volume(sfx_bus, _sfxvol);
fmod_studio_bus_set_volume(music_bus, _musvol);


if (!instance_exists(obj_player))
	return;
	
var _char = 0;
switch (obj_player.character)
{
	default:
		_char = 0;
		break;
		
	case "N":
		_char = 1;
		break;
		
	case "G":
		_char = 2;
		break;
	
	case "C":
		_char = 3;
		break;
		
	case "P":
		_char = 4;
		break;
		
	case "T":
	case "PT":
		_char = 5;
		break;
		
	case "V":
		_char = 6;
		break;
		
	case "M":
		_char = 7;
		break;
		
	case "Z":
		_char = 8;
		break;
		
	case "RM":
		_char = 9;
		break;
		
	case "GB":
		_char = 10;
		break;
}

fmod_studio_system_set_parameter_by_name("Character", _char)