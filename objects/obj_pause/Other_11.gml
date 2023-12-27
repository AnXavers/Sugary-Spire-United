if (global.levelname != "none")
{
	pausecount = -1;
	audio_stop_sound(mu_pause);
	instance_activate_all();
	scr_levelSet();
	room = global.firstlvlRoom
	modifierinitiate()
	global.gamePauseState = 0;
	with (obj_player)
		targetDoor = "A";
	with (instance_create(x, y, obj_fadeout))
	{
		fadealpha = 1;
		fadein = true;
	}
}
else
	scr_sound(sound_enemythrow);