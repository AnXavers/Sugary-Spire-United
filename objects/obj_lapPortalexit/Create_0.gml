depth = -95;
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
if (global.lapcount = 10)
{
	global.lap10fg = layer_create(-50, "Backgrounds_foreground");
	global.lap10bgspr = layer_background_create(global.lap10fg, bg_collapsing_spire);
	layer_background_htiled(global.lap10bgspr, true);
	layer_background_vtiled(global.lap10bgspr, true);
	layer_vspeed(global.lap10fg, 3);
	global.dolap10fg = 1;
}