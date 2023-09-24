event_inherited()
image_speed = 0.35
depth = 3
if global.O_Mode
{
	if (room == molasses_9 && (!instance_exists(obj_rudejanitor)))
		depth = 3
	else
		instance_destroy()
}
