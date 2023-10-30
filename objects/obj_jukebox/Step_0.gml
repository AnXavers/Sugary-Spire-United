scr_getinput();
if (active == 1)
{
	obj_player.state = states.actor;
	if selectedxy == 0
	{
		var movey = key_down - key_up;
		selectedy += movey;
	}
	else
	{
		var movex = key_down - key_up;
		selectedx += movex;
	}
	var movexy = key_right2 + key_left2;
	selectedxy += movexy
	selectedxy = clamp(selectedxy, 0, 1)
	selectedy = wrap(selectedy, 0, array_length(global.musiclist) - 1);
	selectedx = wrap(selectedx, 0, array_length(global.musiclist) - 1);
	if (key_jump)
	{
		ds_map_set(global.musicreplace, asset_get_index(global.musiclist[selectedy]), asset_get_index(global.musiclist[selectedx]));
		ini_open("optionData.ini")
		ini_write_real("Music", selectedy, selectedx)
		scr_sound(sound_enemythrow);
		ini_close();
	}
	if (keyboard_check_pressed(vk_enter))
	{
		active = 0
		obj_player.state = states.normal;
		global.gamePauseState = 0
	}
}
bgTileX++;
bgTileY++;