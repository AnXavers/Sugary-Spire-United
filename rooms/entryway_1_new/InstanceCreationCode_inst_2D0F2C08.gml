flags.do_once_per_save = true;
output = function()
{
	global.panic = 1;
	var time_array = scr_escapetimes();
	global.fill = time_in_frames(time_array[0], time_array[1]);
	obj_tv.target_fill = global.fill;
	global.wave = 0;
	global.maxwave = global.fill;
	instance_create(round(room_width / 2), 0, obj_yogurtexe);
	ds_list_add(global.saveroom, id);
};
condition = function()
{
	return (global.levelname == "yogurt" && ds_list_find_index(global.saveroom, id) == -1)
};
