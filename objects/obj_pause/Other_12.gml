audio_stop_sound(mu_pause);
pausecount = -1;
if (room != rank_room && room != hub_w1 && room != outer_room1 && room != outer_room2 && room != scootercutsceneidk)
{
	global.gamePauseState = 0;
	instance_activate_all();
	scr_levelSet();
	global.levelname = "none";
	room = hub_w1;
	with (obj_tv)
		tvsprite = spr_tvoff;
	with (obj_player)
		targetDoor = "A";
	with (instance_create(x, y, obj_fadeout))
	{
		fadealpha = 1;
		fadein = true;
	}
}
else if (room == hub_w1 || room == outer_room1 || room == outer_room2 || room == scootercutsceneidk)
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
		scr_characterspr();
		state = 2;
		targetDoor = "A";
	}
	with (instance_create(x, y, obj_fadeout))
	{
		fadealpha = 1;
		fadein = true;
	}
}
else
	scr_sound(sound_enemythrow);
