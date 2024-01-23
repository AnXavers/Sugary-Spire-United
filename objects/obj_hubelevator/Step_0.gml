switch state
{
	case 1:
		if (!instance_exists(obj_fadeout))
		{
			var lengthx = (array_length(hub_array) - 1)
			var lengthy = (array_length(hub_array[0]) - 1)
			if obj_player.key_up2
			{
				selectedy--
				scr_sound(sound_step);
			}
			if obj_player.key_down2
			{
				selectedy++
				scr_sound(sound_step);
			}
			if -obj_player.key_left2
			{
				selectedx--
				scr_sound(sound_step);
			}
			if obj_player.key_right2
			{
				selectedx++
				scr_sound(sound_step);
			}
			selectedx = clamp(selectedx, 0, lengthx)
			selectedy = clamp(selectedy, 0, lengthy)
			if obj_player.key_jump2
			{
				if (hub_array[selectedx][selectedy][0] != room && !(selectedx == 0 && selectedy == 0))
				{
					alarm[0] = 180
					state = 2
					scr_sound(sound_enemythrow);
					scr_sound(sfx_elevator_ding);
					with (obj_player)
					{
						targetRoom = other.hub_array[other.selectedx][other.selectedy][0]
						targetDoor = "E"
						movespeed = 0
					}
				}
				else if (selectedx == 0 && selectedy == 0)
				{
					scr_sound(sound_enemythrow);
					state = 3
					global.preventpause = true
				}
				else
				{
					state = 0
					with (obj_player)
						state = 1
				}
			}
		}
		break;
	case 2:
		if (obj_player.key_jump && alarm[0] != -1)
			alarm[0] = 1
		break;
	case 3:
		if !exitinginfo
			buttonalpha = approach(buttonalpha, 0, 0.05)
		else if surfscale == (-pi / 2)
			buttonalpha = approach(buttonalpha, 1, 0.05)
		if buttonalpha == 0
			surfscale = approach(surfscale, (pi / 2), pi / 60)
		else
			surfscale = approach(surfscale, (-pi / 2), pi / 60)
		if surfscale == (pi / 2)
			textalpha = approach(textalpha, 1, 0.05)
		else
			textalpha = approach(textalpha, 0, 0.1)
		surface_resize(surf, wave(160, 800, 1, 0, surfscale), wave(256, 500, 1, 0, surfscale))
		if keyboard_check(vk_escape)
			exitinginfo = 1
		if buttonalpha == 1
		{
			state = 1
			exitinginfo = 0
			global.preventpause = false
		}
		break;
}