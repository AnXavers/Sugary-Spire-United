with (instance_place(x, y, obj_doortrigger_parent))
	other.targetDoor = id_door;
image_alpha = 0.5;
if (global.panic && instance_exists(obj_lapjanitor))
	image_alpha = 1;