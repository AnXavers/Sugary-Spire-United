//TO BE DELETED
if (selected == 0)
{
	scr_getinput();
	if ((key_up2 || keyboard_check_pressed(vk_up)) && optionselected > 0)
	{
		optionselected--;
		scr_sound(sound_step);
	}
	if ((key_down2 || keyboard_check_pressed(vk_down)) && optionselected < 3)
	{
		optionselected++;
		scr_sound(sound_step);
	}
	switch (optionselected)
	{
		case 0:
			subtitle = "GO BACK TO MAIN OPTIONS";
			CursorY = -999;
			if (key_jump)
			{
				scr_sound(sound_enemythrow);
				instance_destroy();
			}
			break;
		case 1:
			subtitle = "ADJUST MOD VISUALS";
			CursorY = 100;
			if (key_jump)
			{
				scr_sound(sound_enemythrow);
				selected = true;
				instance_create(0, 0, obj_Options_Mod_Visual);
			}
			break;
		case 2:
			subtitle = "ADJUST MOD GAMEPLAY";
			CursorY = 200;
			if (key_jump)
			{
				scr_sound(sound_enemythrow);
				selected = true;
				instance_create(0, 0, obj_Options_Mod_Gameplay);
			}
			break;
		case 3:
			subtitle = "ADJUST IN-GAME LANGUAGE";
			CursorY = 300;
			if (key_jump)
			{
				scr_sound(sound_enemythrow);
				selected = true;
				instance_create(0, 0, obj_Options_Mod_Language);
			}
			break;
	}
	if (key_attack2 || key_start)
	{
		scr_sound(sound_enemythrow);
		instance_destroy();
	}
}
