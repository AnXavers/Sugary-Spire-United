if (global.gamePauseState == 1 && fadealpha <= 0)
{
	global.gamePauseState = 0;
	instance_activate_all();
	audio_resume_all();
	if global.levelname != "secrets"
	{
		audio_resume_sound(global.secret_room ? global.secretmusic : global.music);
		audio_pause_sound(global.secret_room ? global.music : global.secretmusic);
	}
	else
		audio_resume_sound(mu_secrets)
	video_resume();
	instance_destroy();
}
if (fadealpha >= 1)
{
	if (global.gamePauseState == 0)
	{
		global.gamePauseState = 1;
		audio_pause_all();
		video_pause();
		audio_stop_sound(sfx_pausestart);
		scr_sound(sfx_pausestart);
		instance_deactivate_all(true);
		instance_activate_object(obj_pause);
		instance_activate_object(obj_parallax);
		instance_activate_object(obj_screen);
		instance_destroy();
	}
}
if (fadein == 1)
	fadealpha = approach(fadealpha, 1, 0.25);
else if (fadein == 0)
	fadealpha = approach(fadealpha, 0, 0.25);
