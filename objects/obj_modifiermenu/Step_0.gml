if canmove
{
	scr_getinput();
	ScrollY = lerp(ScrollY, CursorY, 0.15);
	if ((key_up2 || keyboard_check_pressed(vk_up)) && optionselected > 0)
	{
		optionselected--;
		scr_sound(sound_step);
	}
	if ((key_down2 || keyboard_check_pressed(vk_down)) && optionselected < 9)
	{
		optionselected++;
		scr_sound(sound_step);
	}
	if (key_right2 || -key_left2)
		scr_sound(sound_step)
	switch (optionselected)
	{
		case 0:
			CursorY = 0
			optionsaved_gamemode += (key_right2 + key_left2);
			optionsaved_gamemode = wrap(optionsaved_gamemode, 0, 4)
			global.gamemode = optionsaved_gamemode
			break;
		case 1:
			CursorY = 30
			optionsaved_leveldesign += (key_right2 + key_left2);
			optionsaved_leveldesign = wrap(optionsaved_leveldesign, 0, 3)
			global.leveldesign = optionsaved_leveldesign
			break;
		case 2:
			CursorY = 60
			optionsaved_lapmode += (key_right2 + key_left2);
			optionsaved_lapmode = wrap(optionsaved_lapmode, 0, 3)
			global.lapmode = optionsaved_lapmode
			break;
		case 3:
			CursorY = 90
			optionsaved_jerald += (key_right2 + key_left2);
			optionsaved_jerald = wrap(optionsaved_jerald, 0, 1)
			global.jerald = optionsaved_jerald
			break;
		case 4:
			CursorY = 120
			optionsaved_perfect += (key_right2 + key_left2);
			optionsaved_perfect = wrap(optionsaved_perfect, 0, 7)
			global.perfect = optionsaved_perfect
			break;
		case 5:
			CursorY = 150
			optionsaved_flashlight += (key_right2 + key_left2);
			optionsaved_flashlight = wrap(optionsaved_flashlight, 0, 1)
			global.flashlight = optionsaved_flashlight
			break;
		case 6:
			CursorY = 180
			optionsaved_collects += (key_right2 + key_left2);
			optionsaved_collects = wrap(optionsaved_collects, 0, 1)
			global.collects = optionsaved_collects
			break;
		case 7:
			CursorY = 210
			optionsaved_breakables += (key_right2 + key_left2);
			optionsaved_breakables = wrap(optionsaved_breakables, 0, 1)
			global.breakables = optionsaved_breakables
			break;
		case 8:
			CursorY = 240
			optionsaved_enemies += (key_right2 + key_left2);
			optionsaved_enemies = wrap(optionsaved_enemies, 0, 1)
			global.enemies = optionsaved_enemies
			break;
		case 9:
			CursorY = 270
			optionsaved_escapetimer += (key_right2 + key_left2);
			optionsaved_escapetimer = wrap(optionsaved_escapetimer, 0, 3)
			global.escapetimer = optionsaved_escapetimer
			break;
	}
	if keyboard_check_pressed(vk_escape)
	{
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
bgTileX++
bgTileY++
txtalpha++
fadeinrad = lerp(fadeinrad, ((global.cam_w + global.cam_h) / 2), 0.06)