if (activetimer == 0)
{
	scr_sound(sfx_gravplug_activate);
	activetimer = starttime;
	image_index = 1;
	scr_sleep(starttime + room_speed);
}
