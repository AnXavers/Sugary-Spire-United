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
		optionsaved_newscorefont = global.newscorefont;
		optionsaved_newplayeranim = global.newplayeranim;
		optionsaved_erankstack = global.erankstack;
	}
	if ((key_down2 || keyboard_check_pressed(vk_down)) && optionselected < 4)
	{
		optionselected += 1;
		scr_sound(sound_step);
		optionsaved_newscorefont = global.newscorefont;
		optionsaved_newplayeranim = global.newplayeranim;
		optionsaved_erankstack = global.erankstack;
		optionsaved_slopeangle = global.slopeangle;
		
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
			subtitle = "TOGGLES THE NEW SCORE FONT SEEN IN SS DEV STREAMS";
			CursorY = 100;
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
		case 2:
			subtitle = "CHANES THE PLAYER ANIMATIONS";
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
			subtitle = "CAUSES E RANK TO STACK INSTEAD OF OVERLAYING IT ACROSS THE SCREEN";
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
	}
	if (key_slap2 || key_start)
	{
		scr_sound(sound_enemythrow);
		instance_destroy();
	}
	obj_Options_Main.CursorY = CursorY + ScrollY;
}
