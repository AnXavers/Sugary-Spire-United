audio_stop_sound(mu_pause);
pausecount = -1;
if !is_hub()
{
	global.gamePauseState = 0;
	instance_activate_all();
	scr_levelSet();
	global.levelname = "none";
	room = global.entergateroom
	with (obj_tv)
		tvsprite = spr_tvoff;
	with (instance_create(x, y, obj_fadeout))
	{
		fadealpha = 1;
		fadein = true;
	}
}
else
{
	global.gamePauseState = 0;
	instance_activate_all();
	scr_levelSet();
	global.levelname = "none";
	room = realtitlescreen;
	with (obj_tv)
		tvsprite = spr_tvoff;
	with (obj_player)
	{
		characterspr();
		state = 2;
		targetDoor = "A";
	}
	with (instance_create(x, y, obj_fadeout))
	{
		fadealpha = 1;
		fadein = true;
	}
}