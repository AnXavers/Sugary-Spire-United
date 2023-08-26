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
		optionsaved_heatmeter = global.heatmeter;
		optionsaved_newscorefont = global.newscorefont;
		optionsaved_newplayeranim = global.newplayeranim;
		optionsaved_newlvldesign = global.newlvldesign;
	}
	if ((key_down2 || keyboard_check_pressed(vk_down)) && optionselected < 10)
	{
		optionselected += 1;
		scr_sound(sound_step);
		optionsaved_defaultlap = global.defaultlapmusic;
		optionsaved_mu_lap10 = global.mulap10;
		optionsaved_mu_lap5 = global.mulap5;
		optionsaved_mu_lap2 = global.mulap2;
		optionsaved_mu_escape = global.muescape;
		optionsaved_heatmeter = global.heatmeter;
		optionsaved_newscorefont = global.newscorefont;
		optionsaved_newplayeranim = global.newplayeranim;
		optionsaved_newlvldesign = global.newlvldesign;
		optionsaved_erankstack = global.erankstack;
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
			subtitle = "MUSIC THAT PLAYS DURING LAP 10 ONWARD";
			CursorY = 250;
			optionsaved_mu_lap10 += (key_right2 + key_left2);
			optionsaved_mu_lap10 = wrap(optionsaved_mu_lap10, 0, 2);
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
						global.lap10song = mu_10peppino
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
			CursorY = 450;
			optionsaved_mu_lap5 += (key_right2 + key_left2);
			optionsaved_mu_lap5 = wrap(optionsaved_mu_lap5, 0, 2);
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
				}
				ini_open("optionData.ini");
				ini_write_real("Settings", "mu_lap5", optionsaved_mu_lap5);
				ini_close();
				global.mulap5 = optionsaved_mu_lap5;
			}
			break;
		case 4:
			subtitle = "MUSIC THAT PLAYS DURING LAP 2 TO 4";
			CursorY = 650;
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
			CursorY = 900;
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
			subtitle = "TOGGLE THE HEATMETER";
			CursorY = 1150;
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
		case 7:
			subtitle = "TOGGLES THE NEW SCORE FONT SEEN IN SS DEV STREAMS";
			CursorY = 1300;
			optionsaved_newscorefont += (key_right2 + key_left2);
			optionsaved_newscorefont = wrap(optionsaved_newscorefont, 0, 1);
			if (key_jump)
			{
				scr_sound(sound_enemythrow);
				ini_open("optionData.ini");
				ini_write_real("Settings", "newscorefont", optionsaved_newscorefont);
				ini_close();
				global.newscorefont = optionsaved_newscorefont;
			}
			break;
		case 8:
			subtitle = "TOGGLES THE NEW PLAYER ANIMATIONS SEEN IN SS DEV STREAMS";
			CursorY = 1450;
			optionsaved_newplayeranim += (key_right2 + key_left2);
			optionsaved_newplayeranim = wrap(optionsaved_newplayeranim, 0, 1);
			if (key_jump)
			{
				scr_sound(sound_enemythrow);
				ini_open("optionData.ini");
				ini_write_real("Settings", "newplayeranim", optionsaved_newplayeranim);
				ini_close();
				global.newplayeranim = optionsaved_newplayeranim;
			}
			break;
		case 9:
			subtitle = "TOGGLES THE NEW LEVEL DESIGNS SEEN IN SS DEV STREAMS";
			CursorY = 1600;
			optionsaved_newlvldesign += (key_right2 + key_left2);
			optionsaved_newlvldesign = wrap(optionsaved_newlvldesign, 0, 1);
			if (key_jump)
			{
				scr_sound(sound_enemythrow);
				ini_open("optionData.ini");
				ini_write_real("Settings", "newlvldesign", optionsaved_newlvldesign);
				ini_close();
				global.newlvldesign = optionsaved_newlvldesign;
			}
			break;
		case 10:
			subtitle = "CAUSES E RANK TO STACK INSTEAD OF OVERLAYING IT ACROSS THE SCREEN";
			CursorY = 1750;
			optionsaved_erankstack += (key_right2 + key_left2);
			optionsaved_erankstack = wrap(optionsaved_erankstack, 0, 1);
			if (key_jump)
			{
				scr_sound(sound_enemythrow);
				ini_open("optionData.ini");
				ini_write_real("Settings", "erankstack", optionsaved_erankstack);
				ini_close();
				global.erankstack = optionsaved_erankstack;
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
