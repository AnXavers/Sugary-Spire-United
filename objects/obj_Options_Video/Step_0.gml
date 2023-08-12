if (canmove == 1)
{
	scr_getinput();
	ScrollY = lerp(ScrollY, (optionselected / 7) * -500, 0.15);
	if ((key_up2 || keyboard_check_pressed(vk_up)) && optionselected > 0)
	{
		optionselected -= 1;
		scr_sound(sound_step);
		optionsaved_fullscreen = global.fullscreen;
		optionsaved_resolution = global.selectedResolution;
		optionsaved_smoothcam = global.smoothcam;
		optionsaved_screentilt = global.screentilt;
		optionsaved_hitstun = global.hitstunEnabled;
		optionsaved_tvmessages = global.tvmessages;
		optionsaved_lowperformance = global.lowperformance;
	}
	if ((key_down2 || keyboard_check_pressed(vk_down)) && optionselected < 8)
	{
		optionselected += 1;
		scr_sound(sound_step);
		optionsaved_fullscreen = global.fullscreen;
		optionsaved_resolution = global.selectedResolution;
		optionsaved_smoothcam = global.smoothcam;
		optionsaved_screentilt = global.screentilt;
		optionsaved_hitstun = global.hitstunEnabled;
		optionsaved_tvmessages = global.tvmessages;
		optionsaved_lowperformance = global.lowperformance;
		optionsaved_smoothscale = global.smoothscale;
	}
	switch (optionselected)
	{
		case 0:
			subtitle = "GO BACK TO MAIN SCREEN";
			CursorY = -999;
			if (key_jump)
			{
				scr_sound(sound_enemythrow);
				instance_destroy();
			}
			break;
		case 1:
			subtitle = "TOGGLE WINDOW MODE";
			CursorY = 100;
			optionsaved_fullscreen += (key_right2 + key_left2);
			optionsaved_fullscreen = wrap(optionsaved_fullscreen, 0, 1);
			if (key_jump)
			{
				scr_sound(sound_enemythrow);
				window_set_fullscreen(optionsaved_fullscreen);
				ini_open("optionData.ini");
				ini_write_real("Settings", "fullscrn", optionsaved_fullscreen);
				ini_close();
				global.fullscreen = optionsaved_fullscreen;
			}
			break;
		case 2:
			subtitle = "ADJUST WINDOWED RESOLUTION";
			CursorY = 200;
			optionsaved_resolution += (key_right2 + key_left2);
			optionsaved_resolution = wrap(optionsaved_resolution, 0, 4);
			if (key_jump)
			{
				scr_sound(sound_enemythrow);
				switch (optionsaved_resolution)
				{
					case 0:
						window_set_size(480, 260);
						window_set_min_width(480)
						window_set_min_height(260)
						break;
					case 1:
						window_set_size(960, 540);
						window_set_min_width(960)
						window_set_min_height(540)
						break;
					case 2:
						window_set_size(1280, 720);
						window_set_min_width(1280)
						window_set_min_height(720)
						break;
					case 3:
						window_set_size(1920, 1080);
						window_set_min_width(1920)
						window_set_min_height(1080)
						break;
					case 4:
						window_set_size(3840, 1080);
						window_set_min_width(3840)
						window_set_min_height(1080)
						break;
				}
				ini_open("optionData.ini");
				ini_write_real("Settings", "resolution", optionsaved_resolution);
				ini_close();
				alarm[1] = 1;
				global.selectedResolution = optionsaved_resolution;
			}
			break;
		case 3:
			subtitle = "TOGGLES HITSTUN";
			CursorY = 350;
			optionsaved_hitstun += (key_right2 + key_left2);
			optionsaved_hitstun = wrap(optionsaved_hitstun, 0, 1);
			if (key_jump)
			{
				scr_sound(sound_enemythrow);
				ini_open("optionData.ini");
				ini_write_real("Settings", "hitstun", optionsaved_hitstun);
				ini_close();
				global.hitstunEnabled = optionsaved_hitstun;
			}
			break;
		case 4:
			subtitle = "TOGGLE SMOOTHCAM";
			CursorY = 450;
			optionsaved_smoothcam += (key_right2 + key_left2);
			optionsaved_smoothcam = wrap(optionsaved_smoothcam, 0, 1);
			if (key_jump)
			{
				scr_sound(sound_enemythrow);
				ini_open("optionData.ini");
				ini_write_real("Settings", "smthcam", optionsaved_smoothcam);
				ini_close();
				global.smoothcam = optionsaved_smoothcam;
			}
			break;
		case 5:
			subtitle = "TOGGLE ESCAPE SCREEN MELT EFFECTS";
			CursorY = 550;
			optionsaved_screenmelt += (key_right2 + key_left2);
			optionsaved_screenmelt = wrap(optionsaved_screenmelt, 0, 1);
			if (key_jump)
			{
				scr_sound(sound_enemythrow);
				ini_open("optionData.ini");
				ini_write_real("Settings", "tvmsg", optionsaved_screenmelt);
				ini_close();
				global.screenmelt = optionsaved_screenmelt;
			}
			break;
		case 6:
			subtitle = "TOGGLE ESCAPE SCREEN TILT EFFECTS";
			CursorY = 650;
			optionsaved_screentilt += (key_right2 + key_left2);
			optionsaved_screentilt = wrap(optionsaved_screentilt, 0, 1);
			if (key_jump)
			{
				scr_sound(sound_enemythrow);
				ini_open("optionData.ini");
				ini_write_real("Settings", "scrntilt", optionsaved_screentilt);
				ini_close();
				global.screentilt = optionsaved_screentilt;
			}
			break;
		case 7:
			subtitle = "TOGGLE TV MESSAGE POPUPS";
			CursorY = 750;
			optionsaved_tvmessages += (key_right2 + key_left2);
			optionsaved_tvmessages = wrap(optionsaved_tvmessages, 0, 1);
			if (key_jump)
			{
				scr_sound(sound_enemythrow);
				ini_open("optionData.ini");
				ini_write_real("Settings", "tvmsg", optionsaved_tvmessages);
				ini_close();
				global.tvmessages = optionsaved_tvmessages;
			}
			break;
		case 8:
			subtitle = "TOGGLE LOW PERFORMANCE MODE";
			CursorY = 850;
			optionsaved_lowperformance += (key_right2 + key_left2);
			optionsaved_lowperformance = wrap(optionsaved_lowperformance, 0, 1);
			if (key_jump)
			{
				scr_sound(sound_enemythrow);
				ini_open("optionData.ini");
				ini_write_real("Settings", "lowperf", optionsaved_lowperformance);
				ini_close();
				if (optionsaved_lowperformance != global.lowperformance)
				{
					var a = layer_get_all();
					for (var i = 0; i < array_length(a); i++)
						layer_enable_fx(a[i], global.lowperformance);
				}
				global.lowperformance = optionsaved_lowperformance;
			}
			break;
	}
	if (key_slap2 || key_start)
	{
		scr_sound(sound_enemythrow);
		instance_destroy();
	}
	obj_Options_Main.CursorY = CursorY + ScrollY;
}
