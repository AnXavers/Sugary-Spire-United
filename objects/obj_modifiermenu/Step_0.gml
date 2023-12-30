if canmove
{
	scr_getinput();
	ScrollX = lerp(ScrollX, CursorX, 0.15);
	ScrollY = lerp(ScrollY, CursorY, 0.15);
	if ((-key_left2) && optionselected > 0)
	{
		optionselected--;
		scr_sound(sound_step);
	}
	if ((key_right2) && optionselected < 9)
	{
		optionselected++;
		scr_sound(sound_step);
	}
	if (key_up2 || key_down2)
		scr_sound(sound_step)
	switch (optionselected)
	{
		case 0:
			optionsaved_gamemode += (key_down2 - key_up2);
			optionsaved_gamemode = wrap(optionsaved_gamemode, 0, 4)
			sub_optionselected = optionsaved_gamemode
			global.gamemode = optionsaved_gamemode
			break;
		case 1:
			optionsaved_leveldesign += (key_down2 - key_up2);
			optionsaved_leveldesign = wrap(optionsaved_leveldesign, 0, 3)
			sub_optionselected = optionsaved_leveldesign
			global.leveldesign = optionsaved_leveldesign
			break;
		case 2:
			optionsaved_lapmode += (key_down2 - key_up2);
			optionsaved_lapmode = wrap(optionsaved_lapmode, 0, 3)
			sub_optionselected = optionsaved_lapmode
			global.lapmode = optionsaved_lapmode
			break;
		case 3:
			optionsaved_jerald += (key_down2 - key_up2);
			optionsaved_jerald = wrap(optionsaved_jerald, 0, 1)
			sub_optionselected = optionsaved_jerald
			global.jerald = optionsaved_jerald
			break;
		case 4:
			optionsaved_perfect += (key_down2 - key_up2);
			optionsaved_perfect = wrap(optionsaved_perfect, 0, 7)
			sub_optionselected = optionsaved_perfect
			global.perfect = optionsaved_perfect
			break;
		case 5:
			optionsaved_flashlight += (key_down2 - key_up2);
			optionsaved_flashlight = wrap(optionsaved_flashlight, 0, 1)
			sub_optionselected = optionsaved_flashlight
			global.flashlight = optionsaved_flashlight
			break;
		case 6:
			optionsaved_collects += (key_down2 - key_up2);
			optionsaved_collects = wrap(optionsaved_collects, 0, 1)
			sub_optionselected = optionsaved_collects
			global.collects = optionsaved_collects
			break;
		case 7:
			optionsaved_breakables += (key_down2 - key_up2);
			optionsaved_breakables = wrap(optionsaved_breakables, 0, 1)
			sub_optionselected = optionsaved_breakables
			global.breakables = optionsaved_breakables
			break;
		case 8:
			optionsaved_enemies += (key_down2 - key_up2);
			optionsaved_enemies = wrap(optionsaved_enemies, 0, 1)
			sub_optionselected = optionsaved_enemies
			global.enemies = optionsaved_enemies
			break;
		case 9:
			optionsaved_escapetimer += (key_down2 - key_up2);
			optionsaved_escapetimer = wrap(optionsaved_escapetimer, 0, 3)
			sub_optionselected = optionsaved_escapetimer
			global.escapetimer = optionsaved_escapetimer
			break;
	}
	CursorX = (optionselected * 200)
	CursorY = (sub_optionselected * 30)
	if (keyboard_check(vk_escape) || keyboard_check(vk_enter))
	{
		audio_stop_sound(mu_modifiers)
		audio_stop_sound(sfx_modifiersstart)
		with obj_player
		{
			switch other.optionsaved_leveldesign
			{
				case 1:
					if ((asset_get_index(room_get_name(targetRoom) + "_new")) != -1)
						targetRoom = asset_get_index(room_get_name(targetRoom) + "_new")
					break;
				case 2:
					if ((asset_get_index(room_get_name(targetRoom) + "_old")) != -1)
						targetRoom = asset_get_index(room_get_name(targetRoom) + "_old")
					break;
				case 3:
					if ((asset_get_index(room_get_name(targetRoom) + "_custom")) != -1)
						targetRoom = asset_get_index(room_get_name(targetRoom) + "_custom")
					break;
			}
		}
		with instance_nearest(x, y, obj_startgate)
		{
			if !instance_exists(obj_titlecard) && do_titlecard
			{
				with instance_create(x, y, obj_titlecard)
					info = other.info
				other.canmove = false
			}
			else if !instance_exists(obj_fadeout) && !do_titlecard
			{
				instance_create(x, y, obj_fadeout);
				obj_tv.tvsprite = spr_tvturnon;
				obj_tv.image_index = 0;
				other.canmove = false
			}
		}
	}
}
if !audio_is_playing(sfx_modifiersstart) && !audio_is_playing(mu_modifiers) && !instance_exists(obj_titlecard) && !instance_exists(obj_fadeout)
	scr_soundloop(mu_modifiers)
modifierfxval = lerp(modifierfxval, 4, 0.05)
fx_set_parameter(modifierfx, "g_Radius", [modifierfxval])
bgTileX++
bgTileY++
txtalpha++