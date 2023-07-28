scr_getinput();
if (active == 1)
{
	obj_player.state = states.actor;
	move = key_left2 + key_right2;
	selected += move;
	selected = wrap(selected, 0, array_length(music) - 1);
	if (key_jump)
	{
		var _song = music[selected][0];
		audio_stop_all_music();
		global.music = scr_music(_song);
	}
}
