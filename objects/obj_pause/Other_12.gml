audio_stop_sound(mu_pause);
pausecount = -1;
if (room != rank_room && room != hub_w1 && room != outer_room1 && room != scootercutsceneidk && room != hub_w1old && room != hub_w2 && room != hub_w3 && room != hub_hallway && room != hub_outside && room != hub_top && room != hub_basement && room != silver_4 && room != silver_3 && room != silver_2 && room != silver_1 && room != silver_0)
{
	global.gamePauseState = 0;
	instance_activate_all();
	scr_levelSet();
	global.levelname = "none";
	room = global.entergateroom;
	with (obj_tv)
		tvsprite = spr_tvoff;
	with (obj_player)
		targetDoor = global.entergatedoor;
	with (instance_create(x, y, obj_fadeout))
	{
		fadealpha = 1;
		fadein = true;
	}
}
else if (room != rank_room)
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
