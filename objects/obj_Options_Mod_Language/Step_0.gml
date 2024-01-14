if canmove
{
	scr_getinput();
	if optionselected == 0
		ScrollY = lerp(ScrollY, (optionselected / 10) * -500, 0.15);
	else
		ScrollY = lerp(ScrollY, (CursorY / 600) * -500, 0.15);
	if ((key_up2 || keyboard_check_pressed(vk_up)) && optionselected > 0)
	{
		optionselected--;
		scr_sound(sound_step);
	}
	if ((key_down2 || keyboard_check_pressed(vk_down)) && optionselected < 1)
	{
		optionselected++;
		scr_sound(sound_step);
		optionsaved_language = global.language;
		
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
			subtitle = "TOGGLE THE LANGUAGE SHOWN IN-GAME";
			optionsaved_language += (key_right2 + key_left2);
			optionsaved_language = wrap(optionsaved_language, 0, 3);
			CursorY = 150 + (optionsaved_language * 50);
			if (key_jump)
			{
				scr_sound(sound_enemythrow);
				ini_open("optionData.ini");
				ini_write_real("Settings", "language", optionsaved_language);
				ini_close();
				global.language = optionsaved_language;
			}
			break;
	}
	if (key_attack2 || key_start)
	{
		scr_sound(sound_enemythrow);
		instance_destroy();
	}
	obj_Options_Main.CursorY = CursorY + ScrollY;
}
