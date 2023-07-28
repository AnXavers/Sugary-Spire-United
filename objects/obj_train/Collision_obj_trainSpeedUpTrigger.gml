if (state == 1)
{
	if (!audio_is_playing(sound_train))
		scr_sound(sound_train);
	movespeed = 17;
}
