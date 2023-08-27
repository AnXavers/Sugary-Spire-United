var time_array = scr_laptimes();
global.fill += time_in_frames(time_array[0], time_array[1]);
if !instance_exists(obj_panicchanger)
	instance_create(x, y, obj_panicchanger);
instance_destroy();