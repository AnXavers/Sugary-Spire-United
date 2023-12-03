if (!shown)
{
	if (fadein == 0)
		fadealpha += 0.1
	if (fadealpha > 1)
	{
		shown = 1
		room_goto(rm_titlecard)
		scr_sound(info.song);
		switch info.bginfo[1]
		{
			case 0:
				bgY = (-sprite_get_height(info.bginfo[0]))
				bgX = 0
				break
			case 1:
				bgY = sprite_get_height(info.bginfo[0])
				bgX = 0
				break
			case 2:
				bgY = 0
				bgX = (-sprite_get_width(info.bginfo[0]))
				break
			case 3:
				bgY = 0
				bgX = sprite_get_width(info.bginfo[0])
				break
		}

		switch info.titleinfo[1]
		{
			case 0:
				titleY = -750
				titleX = 0
				break
			case 1:
				titleY = 750
				titleX = 0
				break
			case 2:
				titleY = 0
				titleX = -1280
				break
			case 3:
				titleY = 0
				titleX = 1280
				break
		}
		switch info.featuringinfo[0]
		{
			case 0:
				featuringY = -750
				featuringX = 0
				break
			case 1:
				featuringY = 750
				featuringX = 0
				break
			case 2:
				featuringY = 0
				featuringX = -1280
				break
			case 3:
				featuringY = 0
				featuringX = 1280
				break
		}

	}
}
else
{
	if (info.bginfo[2] == 5)
	{
		bgX = (lerp(bgX, info.bginfo[4], 0.1) + (info.bginfo[3] == 7 ? irandom_range(-2, 2) : 0))
		bgY = ((lerp(bgY, info.bginfo[5], 0.1) + (info.bginfo[3] == 6 ? wave(2, -2, 5, 0) : 0)) + (info.bginfo[3] == 7 ? irandom_range(-2, 2) : 0))
	}
	else
	{
		bgX = (approach(bgX, info.bginfo[4], 40) + (info.bginfo[3] == 7 ? irandom_range(-2, 2) : 0))
		bgY = ((approach(bgY, info.bginfo[5], 40) + (info.bginfo[3] == 6 ? wave(2, -2, 5, 0) : 0)) + (info.bginfo[3] == 7 ? irandom_range(-2, 2) : 0))
	}
	step += 0.025
	if (round(step) > 0)
	{
		if (info.titleinfo[2] == 5)
		{
			titleX = (lerp(titleX, info.titleinfo[4], 0.1) + (info.titleinfo[3] == 7 ? irandom_range(-2, 2) : 0))
			titleY = ((lerp(titleY, info.titleinfo[5], 0.1) + (info.titleinfo[3] == 6 ? wave(2, -2, 5, 0) : 0)) + (info.titleinfo[3] == 7 ? irandom_range(-2, 2) : 0))
		}
		else
		{
			titleX = (approach(titleX, info.titleinfo[4], 40) + (info.titleinfo[3] == 7 ? irandom_range(-2, 2) : 0))
			titleY = ((approach(titleY, info.titleinfo[5], 40) + (info.titleinfo[3] == 6 ? wave(2, -2, 5, 0) : 0)) + (info.titleinfo[3] == 7 ? irandom_range(-2, 2) : 0))
		}
		if (info.featuringinfo[1] == 5)
		{
			featuringX = (lerp(featuringX, info.featuringinfo[3], 0.1) + (info.featuringinfo[2] == 7 ? irandom_range(-2, 2) : 0))
			featuringY = ((lerp(featuringY, info.featuringinfo[4], 0.1) + (info.featuringinfo[2] == 6 ? wave(2, -2, 5, 0) : 0)) + (info.featuringinfo[2] == 7 ? irandom_range(-2, 2) : 0))
		}
		else
		{
			featuringX = (approach(featuringX, info.featuringinfo[3], 40) + (info.featuringinfo[2] == 7 ? irandom_range(-2, 2) : 0))
			featuringY = ((approach(featuringY, info.featuringinfo[4], 40) + (info.featuringinfo[2] == 6 ? wave(2, -2, 5, 0) : 0)) + (info.featuringinfo[2] == 7 ? irandom_range(-2, 2) : 0))
		}
	}
	if (((!audio_is_playing(info.song)) && round(step) > 3) || keyboard_check_pressed(vk_enter))
	{
		audio_stop_sound(info.song)
		if (!instance_exists(obj_fadeout))
		{
			instance_create(x, y, obj_fadeout);
			obj_tv.tvsprite = spr_tvturnon;
			obj_tv.image_index = 0;
		}
	}
}
