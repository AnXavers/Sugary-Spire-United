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
		optionsaved_defaultlap = global.defaultlapmusic;
		optionsaved_mu_lap10 = global.mulap10;
		optionsaved_mu_lap5 = global.mulap5;
		optionsaved_mu_lap2 = global.mulap2;
		optionsaved_mu_escape = global.muescape;
		optionsaved_mu_overdose = global.muoverdose;
	}
	if ((key_down2 || keyboard_check_pressed(vk_down)) && optionselected < 7)
	{
		optionselected += 1;
		scr_sound(sound_step);
		optionsaved_defaultlap = global.defaultlapmusic;
		optionsaved_mu_lap10 = global.mulap10;
		optionsaved_mu_lap5 = global.mulap5;
		optionsaved_mu_lap2 = global.mulap2;
		optionsaved_mu_escape = global.muescape;
		optionsaved_mu_overdose = global.muoverdose;
		optionsaved_mu_lowface = global.mulowface;
		
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
			subtitle = "TOGGLE CUSTOM MUSIC";
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
			subtitle = "MUSIC THAT PLAYS DURING LAP 10 ONWARD";
			CursorY = 250;
			optionsaved_mu_lap10 += (key_right2 + key_left2);
			optionsaved_mu_lap10 = wrap(optionsaved_mu_lap10, 0, 3);
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
					case 2:
						global.lap10song = mu_mayhem
						break;
					case 3:
						global.lap10song = mu_lap4
						break;
				}
				ini_open("optionData.ini");
				ini_write_real("Settings", "mu_lap10", optionsaved_mu_lap10);
				ini_close();
				global.mulap10 = optionsaved_mu_lap10;
			}
			break;
		case 3:
			subtitle = "MUSIC THAT PLAYS DURING LAP 5 TO 9";
			CursorY = 500;
			optionsaved_mu_lap5 += (key_right2 + key_left2);
			optionsaved_mu_lap5 = wrap(optionsaved_mu_lap5, 0, 3);
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
					case 2:
						global.lap5song = mu_despairypeppino;
						break;
					case 3:
						global.lap5song = mu_overdose;
						break;
				}
				ini_open("optionData.ini");
				ini_write_real("Settings", "mu_lap5", optionsaved_mu_lap5);
				ini_close();
				global.mulap5 = optionsaved_mu_lap5;
			}
			break;
		case 4:
			subtitle = "MUSIC THAT PLAYS DURING LAP 2 TO 4";
			CursorY = 750;
			optionsaved_mu_lap2 += (key_right2 + key_left2);
			optionsaved_mu_lap2 = wrap(optionsaved_mu_lap2, 0, 3);
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
					case 2:
						global.lap2song = mu_noiselap;
						break;
					case 3:
						global.lap2song = mu_peppinolap;
						break;
				}
				ini_open("optionData.ini");
				ini_write_real("Settings", "mu_lap2", optionsaved_mu_lap2);
				ini_close();
				global.mulap2 = optionsaved_mu_lap2;
			}
			break;
		case 5:
			subtitle = "MUSIC THAT PLAYS DURING THE ESCAPE";
			CursorY = 1000;
			optionsaved_mu_escape += (key_right2 + key_left2);
			optionsaved_mu_escape = wrap(optionsaved_mu_escape, 0, 3);
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
					case 2:
						global.escapesong = mu_noiseescape;
						break;
					case 3:
						global.escapesong = mu_peppinoescape;
						break;
				}
				ini_open("optionData.ini");
				ini_write_real("Settings", "mu_escape", optionsaved_mu_escape);
				ini_close();
				global.muescape = optionsaved_mu_escape;
			}
			break;
		case 6:
			subtitle = "MUSIC THAT PLAYS DURING SUGARY OVERDOSE";
			CursorY = 1250;
			optionsaved_mu_overdose += (key_right2 + key_left2);
			optionsaved_mu_overdose = wrap(optionsaved_mu_overdose, 0, 1);
			if (key_jump)
			{
				scr_sound(sound_enemythrow);
				switch (optionsaved_mu_overdose)
				{
					case 0:
						global.overdosesong = mu_overdose;
						break;
					case 1:
						global.overdosesong = mu_pizzanoescape;
						break;
				}
				ini_open("optionData.ini");
				ini_write_real("Settings", "mu_overdose", optionsaved_mu_overdose);
				ini_close();
				global.muoverdose = optionsaved_mu_overdose;
			}
			break;
		case 7:
			subtitle = "MUSIC THAT PLAYS DURING LOWFACE MODE";
			CursorY = 1400;
			optionsaved_mu_lowface += (key_right2 + key_left2);
			optionsaved_mu_lowface = wrap(optionsaved_mu_lowface, 0, 1);
			if (key_jump)
			{
				scr_sound(sound_enemythrow);
				switch (optionsaved_mu_lowface)
				{
					case 0:
						global.lowfacesong = mu_lowface;
						break;
					case 1:
						global.lowfacesong = mu_pizzanoescape;
						break;
				}
				ini_open("optionData.ini");
				ini_write_real("Settings", "mu_lowface", optionsaved_mu_lowface);
				ini_close();
				global.mulowface = optionsaved_mu_lowface;
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