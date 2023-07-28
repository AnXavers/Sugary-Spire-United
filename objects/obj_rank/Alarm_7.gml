if (floor(image_index) >= (image_number - 1))
{
	if (!audio_is_playing(asset_get_index("mu_rank" + global.rank)))
	{
		scr_music(mu_rankloop);
		canleave = 1;
		goup = true;
		flash = 1;
		alarm[7] = -1;
	}
	else
		alarm[7] = 30;
}
else
	alarm[7] = 30;
