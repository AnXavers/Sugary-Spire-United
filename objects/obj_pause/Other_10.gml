audio_stop_sound(sfx_pausestart);
audio_stop_sound(mu_pause);
pausecount = -1;
if (!instance_exists(obj_pausefadeout))
{
	with (instance_create(x, y, obj_pausefadeout))
	{
		fadein = false;
		fadealpha = 1;
	}
}
