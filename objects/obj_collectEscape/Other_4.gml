if ds_list_find_index(global.escaperoom, id) != -1
	instance_destroy();
event_inherited();
if global.panic
	image_alpha = 1;
