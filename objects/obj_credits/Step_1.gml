var _oldsceneBackground = sceneBackground;
if (audio_sound_get_track_position(global.music) < 21.5)
{
	sceneBackground = 1639;
	DrawHspeed = 0.5;
	DrawVspeed = 0;
}
else if (audio_sound_get_track_position(global.music) < 43.2)
{
	sceneBackground = 1950;
	DrawHspeed = 0.5;
	DrawVspeed = 0.5;
}
else if (audio_sound_get_track_position(global.music) < 64.78)
{
	sceneBackground = 1928;
	DrawHspeed = 0;
	DrawVspeed = -0.5;
}
else if (audio_sound_get_track_position(global.music) < 107.94)
{
	sceneBackground = 302;
	DrawHspeed = 0;
	DrawVspeed = 1;
}
else
{
	sceneBackground = 1451;
	DrawHspeed = 1;
	DrawVspeed = 1;
}
if (_oldsceneBackground != sceneBackground)
{
	flash = true;
	alarm[0] = 0.15 * room_speed;
	DrawX = 0;
	DrawY = 0;
	if (sceneBackground == 1639)
	{
		y = ystart;
		vspeed = 0;
		can_goUp = true;
	}
}
