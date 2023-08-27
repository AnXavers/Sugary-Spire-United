with (instance_place(x, y, obj_doortrigger_parent))
	other.targetDoor = id_door;
image_alpha = 0.5;
if (global.panic && (instance_exists(obj_lapjanitor) || !global.enablejerald))
	image_alpha = 1;
if ((ds_list_find_index(global.saveroom, id) != -1) && !global.inflapping)
	instance_destroy()