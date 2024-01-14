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
		optionsaved_heatmeter = global.heatmeter;
		optionsaved_coneballparry = global.coneballparry;
		optionsaved_moveset = global.moveset;
		optionsaved_attackmove = global.attackmove;
	}
	if ((key_down2 || keyboard_check_pressed(vk_down)) && optionselected < 5)
	{
		optionselected++;
		scr_sound(sound_step);
		optionsaved_heatmeter = global.heatmeter;
		optionsaved_coneballparry = global.coneballparry;
		optionsaved_moveset = global.moveset;
		optionsaved_attackmove = global.attackmove;
		optionsaved_checkpoints = global.checkpoints;
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
			subtitle = "ALLOWS YOU TO PARRY AND SUPERTAUNT CONEBALL";
			CursorY = 200;
			optionsaved_coneballparry += (key_right2 + key_left2);
			optionsaved_coneballparry = wrap(optionsaved_coneballparry, 0, 1);
			if (key_jump)
			{
				scr_sound(sound_enemythrow);
				ini_open("optionData.ini");
				ini_write_real("Settings", "coneballparry", optionsaved_coneballparry);
				ini_close();
				global.coneballparry = optionsaved_coneballparry;
			}
			break;
		case 3:
			subtitle = "CHANGES THE PLAYER MOVESET";
			CursorY = 300;
			optionsaved_moveset += (key_right2 + key_left2);
			optionsaved_moveset = wrap(optionsaved_moveset, 0, 2);
			if (key_jump)
			{
				scr_sound(sound_enemythrow);
				ini_open("optionData.ini");
				ini_write_real("Settings", "moveset", optionsaved_moveset);
				ini_close();
				global.moveset = optionsaved_moveset;
			}
			break;
		case 4:
			subtitle = "CHANGES THE ATTACK MOVE";
			CursorY = 400;
			optionsaved_attackmove += (key_right2 + key_left2);
			optionsaved_attackmove = wrap(optionsaved_attackmove, 0, 3);
			if (key_jump)
			{
				scr_sound(sound_enemythrow);
				ini_open("optionData.ini");
				ini_write_real("Settings", "attackmove", optionsaved_attackmove);
				ini_close();
				global.attackmove = optionsaved_attackmove;
			}
			break;
		case 5:
			subtitle = "ADDS CHECKPOINTS TO THE START OF EACH LAP";
			CursorY = 550;
			optionsaved_checkpoints += (key_right2 + key_left2);
			optionsaved_checkpoints = wrap(optionsaved_checkpoints, 0, 1);
			if (key_jump)
			{
				scr_sound(sound_enemythrow);
				ini_open("optionData.ini");
				ini_write_real("Settings", "checkpoints", optionsaved_checkpoints);
				ini_close();
				global.checkpoints = optionsaved_checkpoints;
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
