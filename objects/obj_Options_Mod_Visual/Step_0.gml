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
		optionsaved_newscorefont = global.newscorefont;
		optionsaved_newplayeranim = global.newplayeranim;
		optionsaved_erankstack = global.erankstack;
		optionsaved_slopeangle = global.slopeangle;
		optionsaved_machsfx = global.machsfx;
		optionsaved_eggplantcombo = global.eggplantcombo;
		optionsaved_oldhud = global.oldhud;
		optionsaved_harryfreeze = global.harryfreeze;
		optionsaved_newvoicelines = global.newvoicelines;
		optionsaved_destroyables = global.destroyables;
	}
	if ((key_down2 || keyboard_check_pressed(vk_down)) && optionselected < 11)
	{
		optionselected++;
		scr_sound(sound_step);
		optionsaved_newscorefont = global.newscorefont;
		optionsaved_newplayeranim = global.newplayeranim;
		optionsaved_erankstack = global.erankstack;
		optionsaved_slopeangle = global.slopeangle;
		optionsaved_machsfx = global.machsfx;
		optionsaved_eggplantcombo = global.eggplantcombo;
		optionsaved_oldhud = global.oldhud;
		optionsaved_harryfreeze = global.harryfreeze;
		optionsaved_newvoicelines = global.newvoicelines;
		optionsaved_destroyables = global.destroyables;
		optionsaved_richpresence = global.richpresence;
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
			subtitle = "TOGGLES THE SCORE FONT";
			CursorY = 100;
			optionsaved_newscorefont += (key_right2 + key_left2);
			optionsaved_newscorefont = wrap(optionsaved_newscorefont, 0, 2);
			if (key_jump)
			{
				scr_sound(sound_enemythrow)
				ini_open("optionData.ini");
				ini_write_real("Settings", "newscorefont", optionsaved_newscorefont);
				ini_close();
				global.newscorefont = optionsaved_newscorefont;
			}
			break;
		case 2:
			subtitle = "CHANGES THE PLAYER ANIMATIONS";
			CursorY = 200;
			optionsaved_newplayeranim += (key_right2 + key_left2);
			optionsaved_newplayeranim = wrap(optionsaved_newplayeranim, 0, 3);
			if (key_jump)
			{
				scr_sound(sound_enemythrow);
				ini_open("optionData.ini");
				ini_write_real("Settings", "newplayeranim", optionsaved_newplayeranim);
				ini_close();
				global.newplayeranim = optionsaved_newplayeranim;
			}
			break;
		case 3:
			subtitle = "MAKES E RANK VISUALLY STACK INSTEAD OF OVERLAYING IT ACROSS THE SCREEN";
			CursorY = 350;
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
		case 4:
			subtitle = "CAUSES THE PLAYER SPRITE TO TILT WHILE RUNNING ON SLOPES";
			CursorY = 450;
			optionsaved_slopeangle += (key_right2 + key_left2);
			optionsaved_slopeangle = wrap(optionsaved_slopeangle, 0, 1);
			if (key_jump)
			{
				scr_sound(sound_enemythrow);
				ini_open("optionData.ini");
				ini_write_real("Settings", "slopeangle", optionsaved_slopeangle);
				ini_close();
				global.slopeangle = optionsaved_slopeangle;
			}
			break;
		case 5:
			subtitle = "TOGGLES MACH SOUND EFFECTS";
			CursorY = 550;
			optionsaved_machsfx += (key_right2 + key_left2);
			optionsaved_machsfx = wrap(optionsaved_machsfx, 0, 1);
			if (key_jump)
			{
				scr_sound(sound_enemythrow)
				switch (optionsaved_machsfx)
				{
					case 0:
						global.sfxdash1 = sound_dash1
						global.sfxdash2 = sound_dash2
						global.sfxdash3 = sound_dash3
						global.sfxdash4 = sound_dash4
						break;
					case 1:
						global.sfxdash1 = sound_dash1old
						global.sfxdash2 = sound_dash2old
						global.sfxdash3 = sound_dash3old
						global.sfxdash4 = sound_dash4old
						break;
				}
				ini_open("optionData.ini");
				ini_write_real("Settings", "machsfx", optionsaved_machsfx);
				ini_close();
				global.machsfx = optionsaved_machsfx;
			}
			break;
		case 6:
			subtitle = "MAKES COMBOS APPEAR AS THEY DO IN THE EGGPLANT BUILD OF PT";
			CursorY = 650;
			optionsaved_eggplantcombo += (key_right2 + key_left2);
			optionsaved_eggplantcombo = wrap(optionsaved_eggplantcombo, 0, 1);
			if (key_jump)
			{
				scr_sound(sound_enemythrow);
				ini_open("optionData.ini");
				ini_write_real("Settings", "eggplantcombo", optionsaved_eggplantcombo);
				ini_close();
				global.eggplantcombo = optionsaved_eggplantcombo;
			}
			break;
		case 7:
			subtitle = "GIVES YOU THE OLD HUD SPRITES SEEN IN PT AND SS DEMOS";
			CursorY = 750;
			optionsaved_oldhud += (key_right2 + key_left2);
			optionsaved_oldhud = wrap(optionsaved_oldhud, 0, 1);
			if (key_jump)
			{
				scr_sound(sound_enemythrow);
				ini_open("optionData.ini");
				ini_write_real("Settings", "oldhud", optionsaved_oldhud);
				ini_close();
				global.oldhud = optionsaved_oldhud;
			}
			break;
		case 8:
			subtitle = "FREEZES THE GAME FOR A TIME AFTER HITTING GUMMY HARRY";
			CursorY = 850;
			optionsaved_harryfreeze += (key_right2 + key_left2);
			optionsaved_harryfreeze = wrap(optionsaved_harryfreeze, 0, 1);
			if (key_jump)
			{
				scr_sound(sound_enemythrow);
				ini_open("optionData.ini");
				ini_write_real("Settings", "harryfreeze", optionsaved_harryfreeze);
				ini_close();
				global.harryfreeze = optionsaved_harryfreeze;
			}
			break;
		case 9:
			subtitle = "PLAYS THE NEW PIZZELLE VOICELINES";
			CursorY = 950;
			optionsaved_newvoicelines += (key_right2 + key_left2);
			optionsaved_newvoicelines = wrap(optionsaved_newvoicelines, 0, 1);
			if (key_jump)
			{
				scr_sound(sound_enemythrow);
				ini_open("optionData.ini");
				ini_write_real("Settings", "newvoicelines", optionsaved_newvoicelines);
				ini_close();
				global.newvoicelines = optionsaved_newvoicelines;
			}
			break;
		case 10:
			subtitle = "CHOOSE WHAT DESTROYABLES APPEAR IN LEVELS";
			CursorY = 1050;
			optionsaved_destroyables += (key_right2 + key_left2);
			optionsaved_destroyables = wrap(optionsaved_destroyables, 0, 3);
			if (key_jump)
			{
				scr_sound(sound_enemythrow);
				ini_open("optionData.ini");
				ini_write_real("Settings", "destroyables", optionsaved_destroyables);
				ini_close();
				global.destroyables = optionsaved_destroyables;
			}
			break;
		case 11:
			subtitle = "SHOWS YOUR INGAME STATUS ON DICSORD";
			CursorY = 1200;
			optionsaved_richpresence += (key_right2 + key_left2);
			optionsaved_richpresence = wrap(optionsaved_richpresence, 0, 1);
			if (key_jump)
			{
				scr_sound(sound_enemythrow);
				ini_open("optionData.ini");
				ini_write_real("Settings", "richpresence", optionsaved_richpresence);
				ini_close();
				global.richpresence = optionsaved_richpresence;
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
