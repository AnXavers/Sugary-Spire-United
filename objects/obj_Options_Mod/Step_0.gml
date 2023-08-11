if canmove
{
	scr_getinput();
	ScrollY = lerp(ScrollY, (optionselected / 7) * -500, 0.15);
	if ((key_up2 || keyboard_check_pressed(vk_up)) && optionselected > 0)
	{
		optionselected -= 1;
		scr_sound(sound_step);
		optionsaved_defaultlap = global.defaultlapmusic;
		optionsaved_mu_lap10 = global.mulap10;
		optionsaved_mu_lap5 = global.mulap5;
		optionsaved_mu_lap2 = global.mulap2;
	}
	if ((key_down2 || keyboard_check_pressed(vk_down)) && optionselected < 5)
	{
		optionselected += 1;
		scr_sound(sound_step);
		optionsaved_defaultlap = global.defaultlapmusic;
		optionsaved_mu_lap10 = global.mulap10;
		optionsaved_mu_lap5 = global.mulap5;
		optionsaved_mu_lap2 = global.mulap2;
		optionsaved_mu_escape = global.muescape;
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
			subtitle = "TOGGLE CUSTOM LAP MUSIC";
			CursorY = 100;
			optionsaved_defaultlap += (key_right2 + key_left2);
			optionsaved_defaultlap = wrap(optionsaved_defaultlap, 0, 1);
			if (key_jump)
			{
				scr_sound(sound_enemythrow);
				ini_open("optionData.ini");
				ini_write_real("Settings", "defaultlap", optionsaved_defaultlap);
				ini_close();
				global.defaultlapmusic = optionsaved_defaultlap;
			}
			break;
		case 2:
			subtitle = "LAP 10 MUSIC";
			CursorY = 250;
			optionsaved_mu_lap10 += (key_right2 + key_left2);
			optionsaved_mu_lap10 = wrap(optionsaved_mu_lap10, 0, 1);
			if (key_jump)
			{
				scr_sound(sound_enemythrow);
				switch (optionsaved_mu_lap10)
				{
					case 0:
						global.lap10song = mu_sucrose;
						break;
					case 1:
						global.lap10song = mu_finale;
						break;
				}
				ini_open("optionData.ini");
				ini_write_real("Settings", "mu_lap10", optionsaved_mu_lap10);
				ini_close();
				global.mulap10 = optionsaved_mu_lap10;
			}
			break;
		case 3:
			subtitle = "LAP 5 MUSIC";
			CursorY = 400;
			optionsaved_mu_lap5 += (key_right2 + key_left2);
			optionsaved_mu_lap5 = wrap(optionsaved_mu_lap5, 0, 1);
			if (key_jump)
			{
				scr_sound(sound_enemythrow);
				switch (optionsaved_mu_lap5)
				{
					case 0:
						global.lap5song = mu_despairy;
						break;
					case 1:
						global.lap5song = mu_pizzanodespairy;
						break;
				}
				ini_open("optionData.ini");
				ini_write_real("Settings", "mu_lap5", optionsaved_mu_lap5);
				ini_close();
				global.mulap5 = optionsaved_mu_lap5;
			}
			break;
		case 4:
			subtitle = "LAP 2 MUSIC";
			CursorY = 550;
			optionsaved_mu_lap2 += (key_right2 + key_left2);
			optionsaved_mu_lap2 = wrap(optionsaved_mu_lap2, 0, 1);
			if (key_jump)
			{
				scr_sound(sound_enemythrow);
				switch (optionsaved_mu_lap2)
				{
					case 0:
						global.lap2song = mu_lap;
						break;
					case 1:
						global.lap2song = mu_pizzanolap;
						break;
				}
				ini_open("optionData.ini");
				ini_write_real("Settings", "mu_lap2", optionsaved_mu_lap2);
				ini_close();
				global.mulap2 = optionsaved_mu_lap2;
			}
			break;
		case 5:
			subtitle = "ESCAPE MUSIC";
			CursorY = 700;
			optionsaved_mu_escape += (key_right2 + key_left2);
			optionsaved_mu_escape = wrap(optionsaved_mu_escape, 0, 1);
			if (key_jump)
			{
				scr_sound(sound_enemythrow);
				switch (optionsaved_mu_escape)
				{
					case 0:
						global.escapesong = mu_escape;
						break;
					case 1:
						global.escapesong = mu_pizzanoescape;
						break;
				}
				ini_open("optionData.ini");
				ini_write_real("Settings", "mu_escape", optionsaved_mu_escape);
				ini_close();
				global.muescape = optionsaved_mu_escape;
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
