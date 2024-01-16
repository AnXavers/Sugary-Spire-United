if (activetimer == 0 && interactable)
{
	scr_sound(sfx_gravplug_activate);
	activetimer = starttime;
	image_index = 1;
	interactable = false
	alarm[0] = starttime + (room_speed * 3)
}