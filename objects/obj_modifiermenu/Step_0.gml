if canmove
{
	scr_getinput();
	ScrollY = lerp(ScrollY, SelectedY, 0.15);
	if ((key_up2 || keyboard_check_pressed(vk_up)) && optionselected > 0)
	{
		optionselected--;
		sinceup = 0;
		timer = 0;
		scr_sound(sound_step);
	}
	if ((key_down2 || keyboard_check_pressed(vk_down)) && optionselected < 7)
	{
		optionselected++;
		sincedown = 0;
		timer = 0;
		scr_sound(sound_step);
	}
	if ((key_up || keyboard_check(vk_up)) && optionselected > 0)
	{
		timer++;
		sinceup++;
		if (timer == 40 && sinceup < sincedown)
		{
			optionselected--;
			audio_stop_sound(sound_step);
			scr_sound(sound_step);
		}
	}
	if ((key_down || keyboard_check(vk_down)) && optionselected < 7)
	{
		timer++;
		sincedown++;
		if (timer == 40 && sincedown < sinceup)
		{
			optionselected++;
			audio_stop_sound(sound_step);
			scr_sound(sound_step);
		}
	}
	switch (optionselected)
	{
		case 0:
		case 1:
		case 2:
		case 3:
		case 4:
		case 5:
		case 6:
		case 7:
	}
	if keyboard_check_pressed(vk_escape)
	{
		with instance_nearest(x, y, obj_startgate)
		{
			if !instance_exists(obj_titlecard) && do_titlecard
			{
				with instance_create(x, y, obj_titlecard)
					info = other.info
				other.canmove = false
			}
			else if !instance_exists(obj_fadeout) && !do_titlecard
			{
				instance_create(x, y, obj_fadeout);
				obj_tv.tvsprite = spr_tvturnon;
				obj_tv.image_index = 0;
				other.canmove = false
			}
		}
	}
}
bgTileX++
bgTileY++
txtalpha++
if txtalpha > 50
	canmove = true
fadeinrad = lerp(fadeinrad, ((global.cam_w + global.cam_h) / 2), 0.06)