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
	}
	if ((key_down2 || keyboard_check_pressed(vk_down)) && optionselected < 1)
	{
		optionselected += 1;
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
			CursorY = 100;
			optionsaved_language += (key_right2 + key_left2);
			optionsaved_language = wrap(optionsaved_language, 0, 2);
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
	if (key_slap2 || key_start)
	{
		scr_sound(sound_enemythrow);
		instance_destroy();
	}
	obj_Options_Main.CursorY = CursorY + ScrollY;
}