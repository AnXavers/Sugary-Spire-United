scr_getinput();
if ((-key_left2 || keyboard_check_pressed(vk_left)) && optionselected > 0)
{
	optionselected--;
	scr_sound(sound_step);
}
if ((key_right2 || keyboard_check_pressed(vk_right)) && optionselected < 1)
{
	optionselected++;
	scr_sound(sound_step);
}
if (optionselected == 1 && (key_jump || keyboard_check_pressed(vk_enter)))
{
	with (obj_playerhat)
		image_index = 0;
	with (obj_player)
	{
		characterspr();
		characterpal();
		charactergui();
		characterenv();
		charactersfx();
	}
	file_delete(global.fileselect);
	scr_sound(sound_destroyblock1);
	scr_sound(sound_explosion);
	instance_destroy();
}
if (key_attack2 || keyboard_check_pressed(vk_escape) || (optionselected == 0 && (key_jump || keyboard_check_pressed(vk_enter))))
{
	scr_sound(sound_enemythrow);
	instance_destroy();
}
