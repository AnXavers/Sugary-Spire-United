scr_getinput();
if (active == 1)
{
	obj_player.state = states.actor;
	movey = key_down2 - key_up2;
	movex = key_left2 - key_right2;
	selectedy += movey;
	selectedy = wrap(selectedy, 0, array_length(global.musiclist) - 1);
	selectedx += movex;
	selectedx = wrap(selectedx, 0, array_length(global.musiclist) - 1);
	if (key_jump)
		ds_map_set(global.musicreplace, global.musiclist[selectedy], global.musiclist[selectedx]);
	if (key_attack)
		active = 0
}
bgTileX++;
bgTileY++;