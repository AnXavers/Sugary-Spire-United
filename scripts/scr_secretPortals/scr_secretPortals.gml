function portal_activate(argument0, argument1)
{
	with (argument0)
	{
		var _activate = !secretActivated;
		if (is_undefined(argument1))
			_activate = argument1;
		secretActivated = _activate;
	}
}
function cutscene_secretPortal_start()
{
	var _portal = cutscene_get_actor("SECRETPORTAL");
	var _finished = false;
	global.combofreeze = 30;
	with (obj_player)
	{
		is_inSecretPortal = true;
		state = states.actor;
		hsp = 0;
		vsp = 0;
		sprite_index = spr_pizzelle_hurt;
		image_speed = 0.35;
		if (instance_exists(_portal))
		{
			targetDoor = _portal.targetDoor;
			targetRoom = _portal.targetRoom;
			secretPortal = true;
			x = lerp(x, _portal.x, 0.5);
			y = lerp(y, _portal.y, 0.5);
			if (_portal.sprite_index == spr_secretPortal_tele)
			{
				scale = 1 - (min(_portal.image_index, 9) / 9);
				if (floor(_portal.image_index) >= (_portal.image_number - 1))
				{
					_finished = true;
					scale = 0;
				}
			}
		}
	}
	if (_finished)
		cutscene_event_end();
}
function cutscene_secretPortal_middle()
{
	var _portal = cutscene_get_actor("SECRETPORTAL");
	var _finished = true;
	global.combofreeze = 30;
	with (obj_player)
	{
		is_inSecretPortal = true;
		state = states.actor;
		hsp = 0;
		vsp = 0;
	}
	if (_finished)
	{
		instance_destroy(_portal);
		if (!instance_exists(obj_fadeout))
		{
			if (global.secret_room == 0)
				global.secret_room = 1;
			scr_sound(sound_door);
			instance_create(0, 0, obj_fadeout);
		}
		cutscene_event_end();
	}
}
function cutscene_secretPortal_preend()
{
	static _portal = -4;
	var _finished = false;
	var _state = storedState;
	if global.levelname == "secrets"
	{
		_state = states.freefall
		if (room == (steamy_secret_3) || room == (stormy_secret_3))
			_state = states.cottondrill
	}
	global.combofreeze = 30;
	with (obj_player)
	{
		is_inSecretPortal = true;
		state = states.actor;
		hsp = 0;
		vsp = 0;
		switch (_state)
		{
			case states.mach3:
			case states.mach2:
			case states.mach1:
				sprite_index = spr_mach2;
				break;
			case states.cotton:
			case states.cottondrill:
			case states.cottonroll:
				sprite_index = spr_cottonidle;
				break;
			default:
				sprite_index = spr_pizzelle_groundpound;
				break;
		}
		image_speed = 0.35;
		if (!instance_exists(obj_fadeout))
		{
			scale = approach(scale, 1, 0.05);
			if (!instance_exists(_portal))
				_portal = instance_create(x, y + 14, obj_secretPortalexit);
			else if (scale >= 1)
			{
				scale = 1;
				_finished = true;
			}
		}
	}
	if (_finished)
		cutscene_event_end();
}
function cutscene_secretPortal_end()
{
	static _waittimer = 0;
	var _state = storedState;
	if global.levelname == "secrets"
	{
		_state = states.freefall
		if (room == (steamy_secret_3) || room == (stormy_secret_3))
			_state = states.cottondrill
	}
	var _finished = false;
	global.combofreeze = 30;
	_waittimer++;
	with (obj_player)
	{
		is_inSecretPortal = true;
		state = states.actor;
		hsp = 0;
		vsp = 0;
		if (_waittimer > 10)
		{
			flash = true;
			switch (_state)
			{
				case states.mach3:
					if (movespeed < 12)
						movespeed = 12;
				case states.mach2:
					if (movespeed < 10)
						movespeed = 10;
				case states.mach1:
					state = _state;
					if (movespeed < 6)
						movespeed = 6;
					vsp = -3;
					break;
				default:
					state = _state;
					movespeed = 0;
					break;
			}
			_finished = true;
		}
	}
	if (_finished)
	{
		_waittimer = 0;
		cutscene_event_end();
	}
}
