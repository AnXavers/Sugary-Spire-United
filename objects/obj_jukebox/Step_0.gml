if active
{
	scr_getinput();
	obj_player.state = states.actor;
	if !selectedxy
	{
		var movey = key_down2 - key_up2;
		var qmovey = key_down - key_up
		if qmovey = 0
			wait = 0
		else
			wait += key_down + key_up
		if (wait >= 40 && !(wait mod 4))
			selectedy += qmovey
		selectedy += movey;
	}
	else
	{
		var movex = key_down2 - key_up2;
		var qmovex = key_down - key_up
		if qmovex = 0
			wait = 0
		else
			wait += key_down + key_up
		if (wait >= 40 && !(wait mod 4))
			selectedx += qmovex
		selectedx += movex;
	}
	var movexy = key_right2 + key_left2;
	selectedxy += movexy
	selectedxy = clamp(selectedxy, 0, 1)
	selectedy = wrap(selectedy, 0, array_length(global.musiclist) - 2);
	selectedx = wrap(selectedx, 0, array_length(global.musiclist) - 2);
	if (key_jump)
	{
		ds_map_set(global.musicreplace, asset_get_index(global.musiclist[selectedy]), asset_get_index(global.musiclist[selectedx]));
		ini_open("optionData.ini")
		ini_write_real("Music", selectedy, selectedx)
		scr_sound(sound_enemythrow);
		ini_close();
	}
	if (keyboard_check_pressed(vk_escape))
	{
		active = 0
		obj_player.state = states.normal;
		global.gamePauseState = 0
	}
}
bgTileX++;
bgTileY++;