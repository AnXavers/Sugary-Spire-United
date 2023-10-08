switch state
{
	case 1:
		if (!instance_exists(obj_fadeout))
		{
			var length = (array_length(hub_array) - 1)
			if obj_player.key_up2
			{
				selected--
				scr_sound(sound_step);
			}
			if obj_player.key_down2
			{
				selected++
				scr_sound(sound_step);
			}
			ScrollY = lerp(ScrollY, ((selected / length) * (-((48 * length)))), 0.15)
			selected = clamp(selected, 0, length)
			if obj_player.key_jump2
			{
				if (hub_array[selected][0] != room)
				{
					alarm[0] = 180
					state = (2 << 0)
					scr_sound(sound_enemythrow);
					scr_sound(sfx_elevator_ding);
					with (obj_player)
					{
						targetRoom = other.hub_array[other.selected][0]
						targetDoor = "E"
						movespeed = 0
					}
				}
				else
				{
					state = (0 << 0)
					with (obj_player)
						state = (1 << 0)
				}
			}
		}
		break
	case 2:
		if (obj_player.key_jump && alarm[0] != -1)
			alarm[0] = 1
}

