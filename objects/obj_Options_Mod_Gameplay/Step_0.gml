if canmove
{
	scr_getinput();
	if optionselected == 0
		ScrollY = lerp(ScrollY, (optionselected / 10) * -500, 0.15);
	else
		ScrollY = lerp(ScrollY, (CursorY / 600) * -500, 0.15);
	if ((key_up2 || keyboard_check_pressed(vk_up)) && optionselected > 0)
	{
		optionselected -= 1;
		scr_sound(sound_step);
		optionsaved_heatmeter = global.heatmeter;
		optionsaved_newlvldesign = global.newlvldesign;
		optionsaved_inflapping = global.inflapping;
	}
	if ((key_down2 || keyboard_check_pressed(vk_down)) && optionselected < 4)
	{
		optionselected += 1;
		scr_sound(sound_step);
		optionsaved_heatmeter = global.heatmeter;
		optionsaved_newlvldesign = global.newlvldesign;
		optionsaved_inflapping = global.inflapping;
		optionsaved_enablejerald = global.enablejerald;
		
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
			subtitle = "TOGGLES THE HEATMETER";
			CursorY = 100;
			optionsaved_heatmeter += (key_right2 + key_left2);
			optionsaved_heatmeter = wrap(optionsaved_heatmeter, 0, 1);
			if (key_jump)
			{
				scr_sound(sound_enemythrow);
				ini_open("optionData.ini");
				ini_write_real("Settings", "heatmeter", optionsaved_heatmeter);
				ini_close();
				global.heatmeter = optionsaved_heatmeter;
			}
			break;
		case 2:
			subtitle = "TOGGLES WHAT DESIGNS OF LEVELS ARE USED";
			CursorY = 200;
			optionsaved_newlvldesign += (key_right2 + key_left2);
			optionsaved_newlvldesign = wrap(optionsaved_newlvldesign, 0, 2);
			if (key_jump)
			{
				if (global.levelname == "none" || is_hub())
				{
					scr_sound(sound_enemythrow);
					ini_open("optionData.ini");
					ini_write_real("Settings", "newlvldesign", optionsaved_newlvldesign);
					ini_close();
					global.newlvldesign = optionsaved_newlvldesign;
				}
				else
					scr_sound(sound_enemyslap);
			}
			break;
		case 3:
			subtitle = "TOGGLES WHAT LAPPING MODE TO USE";
			CursorY = 300;
			optionsaved_inflapping += (key_right2 + key_left2);
			optionsaved_inflapping = wrap(optionsaved_inflapping, 0, 2);
			if (key_jump)
			{
				if (global.levelname == "none" || is_hub())
				{
					scr_sound(sound_enemythrow);
					ini_open("optionData.ini");
					ini_write_real("Settings", "inflapping", optionsaved_inflapping);
					ini_close();
					global.inflapping = optionsaved_inflapping;
				}
				else
					scr_sound(sound_enemyslap);
			}
			break;
		case 4:
			subtitle = "REENABLES JERALD WHICH MAKES YOU REQUIRE HIM FOR THE LAP PORTALS";
			CursorY = 400;
			optionsaved_enablejerald += (key_right2 + key_left2);
			optionsaved_enablejerald = wrap(optionsaved_enablejerald, 0, 1);
			if (key_jump)
			{
				scr_sound(sound_enemythrow);
				ini_open("optionData.ini");
				ini_write_real("Settings", "enablejerald", optionsaved_enablejerald);
				ini_close();
				global.enablejerald = optionsaved_enablejerald;
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