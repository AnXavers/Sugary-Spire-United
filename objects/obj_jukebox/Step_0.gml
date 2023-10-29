scr_getinput();
if (active == 1)
{
	obj_player.state = states.actor;
	if selectedxy == 0
	{
		var movey = key_down2 - key_up2;
		selectedy += movey;
	}
	else
	{
		var movex = key_down2 - key_up2;
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
		scr_sound(sound_enemythrow)
	}
	if (key_escape)
		active = 0
}
bgTileX++;
bgTileY++;