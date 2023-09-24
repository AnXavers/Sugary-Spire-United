event_inherited()
image_speed = 0.1
depth = 3
if global.O_Mode
{
	instance_destroy()
	return;
}
if (room == steamy_14 && (!global.O_Mode))
{
	with (obj_platform)
	{
		if (x == 1312 && y == 1184)
			image_xscale = 1
	}
}
