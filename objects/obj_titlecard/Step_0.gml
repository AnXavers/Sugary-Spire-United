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
            case (0 << 0):
                bgY = (-sprite_get_height(info.bginfo[0]))
                bgX = 0
                break
            case (1 << 0):
                bgY = sprite_get_height(info.bginfo[0])
                bgX = 0
                break
            case (2 << 0):
                bgY = 0
                bgX = (-sprite_get_width(info.bginfo[0]))
                break
            case (3 << 0):
                bgY = 0
                bgX = sprite_get_width(info.bginfo[0])
                break
        }

        switch info.titleinfo[1]
        {
            case (0 << 0):
                titleY = -750
                titleX = 0
                break
            case (1 << 0):
                titleY = 750
                titleX = 0
                break
            case (2 << 0):
                titleY = 0
                titleX = -1280
                break
            case (3 << 0):
                titleY = 0
                titleX = 1280
                break
        }

    }
}
else
{
    if (info.bginfo[2] == (5 << 0))
    {
        bgX = (lerp(bgX, info.bginfo[4], 0.1) + (info.bginfo[3] == (7 << 0) ? irandom_range(-2, 2) : 0))
        bgY = ((lerp(bgY, info.bginfo[5], 0.1) + (info.bginfo[3] == (6 << 0) ? wave(2, -2, 5, 0) : 0)) + (info.bginfo[3] == (7 << 0) ? irandom_range(-2, 2) : 0))
    }
    else
    {
        bgX = (approach(bgX, info.bginfo[4], 40) + (info.bginfo[3] == (7 << 0) ? irandom_range(-2, 2) : 0))
        bgY = ((approach(bgY, info.bginfo[5], 40) + (info.bginfo[3] == (6 << 0) ? wave(2, -2, 5, 0) : 0)) + (info.bginfo[3] == (7 << 0) ? irandom_range(-2, 2) : 0))
    }
    step += 0.025
    if (round(step) > 0)
    {
        if (info.titleinfo[2] == (5 << 0))
        {
            titleX = (lerp(titleX, info.titleinfo[4], 0.1) + (info.titleinfo[3] == (7 << 0) ? irandom_range(-2, 2) : 0))
            titleY = ((lerp(titleY, info.titleinfo[5], 0.1) + (info.titleinfo[3] == (6 << 0) ? wave(2, -2, 5, 0) : 0)) + (info.titleinfo[3] == (7 << 0) ? irandom_range(-2, 2) : 0))
        }
        else
        {
            titleX = (approach(titleX, info.titleinfo[4], 40) + (info.titleinfo[3] == (7 << 0) ? irandom_range(-2, 2) : 0))
            titleY = ((approach(titleY, info.titleinfo[5], 40) + (info.titleinfo[3] == (6 << 0) ? wave(2, -2, 5, 0) : 0)) + (info.titleinfo[3] == (7 << 0) ? irandom_range(-2, 2) : 0))
        }
    }
    if ((!audio_is_playing(info.song)) && round(step) > 3)
    {
        if (!instance_exists(obj_fadeout))
        {
            instance_create(x, y, obj_fadeout);
			obj_tv.tvsprite = spr_tvturnon;
			obj_tv.image_index = 0;
		}
	}
}
