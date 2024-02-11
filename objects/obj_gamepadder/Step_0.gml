if deactivated = 0
{
	if (gamepad_discovered && (!device_selected[0]))
	{
		{
			if (instance_exists(obj_pause) && global.gamePauseState == 0)
			{
				for (var i = 0; i < 8; i++)
				{
					var _index = scr_button_pressed(i)
					if (_index != -2)
					{
						device_selected[0] = 1
						global.player_input_device = _index
						confirmspr = 2
					}
				}
			}
		}
	}
   
	i = 0
	while (i < 2)
	{
		if (device_selected[i] && global.player_input_device >= 0)
		{
			if (!gamepad_is_connected(global.player_input_device))
			{
				deactivated = 1
				device_selected[i] = 0
				global.player_input_device = -2
				device_to_reconnect = i
				instance_deactivate_all(true);
				
				break;
			}
			else
			{
				i++
				continue
			}
		}
		else
		{
			i++
			continue
		}
	}
}
else
{
	for (i = 0; i < 8; i++)
	{
		_index = scr_button_pressed(i)
		if (_index != -2)
		{
			if ((!CheckUsedIndex(_index)|| (device_to_reconnect == 1 && _index == -1) && (keyboard_check_pressed(global.key_jumpN) || keyboard_check_pressed(global.key_startN))))
			{
				device_selected[device_to_reconnect] = 1
				global.player_input_device = _index
				deactivated = 0
				instance_activate_all()
				alarm[0] = 1
			}
		
		}
	}
}
gamepad_set_vibration(global.player_input_device, vibration1, vibration1)
vibration1 -= vibrationDecay1
carddex += .3
if confirmspr = 2 && cardspr != spr_rankcardflipping
{
	carddex = 0
	cardspr = spr_rankcardflipping
}
if cardspr = spr_rankcardflipping && carddex >= 6
	cardspr = spr_rankcardflipped
if cardspr = spr_rankcardflipped && carddex >= 2
{
	confirmspr = -2 
	gamepad_discovered = 0
}