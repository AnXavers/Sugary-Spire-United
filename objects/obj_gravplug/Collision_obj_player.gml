if (activetimer == 0 && interactable)
{
	with instance_create(x, y, obj_icontracker)
	{
		target = other
		sprite_index = spr_gravplug
		image_speed = 0.35
	}
	scr_sound(sfx_gravplug_activate);
	activetimer = starttime;
	image_index = 1;
	interactable = false
	alarm[0] = starttime + (room_speed * 1.5)
}