depth = 10;
image_speed = 0.35;
image_index = 0;
if global.inflapping == 1
{
	var time_array = scr_laptimes();
	global.fill += time_in_frames(time_array[0], time_array[1]);
	if !instance_exists(obj_panicchanger)
		instance_create(x, y, obj_panicchanger);
}
else if global.inflapping == 2
{
	if global.lapcount >= 4
	{
		global.coneballaggro = 1
	}
	else if global.lapcount >= 3
	{
		global.fill = 0;
		if (!instance_exists(obj_panicchanger))
			instance_create(x, y, obj_panicchanger);
	}
}