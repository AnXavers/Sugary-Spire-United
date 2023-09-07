with (instance_place(x, y, obj_doortrigger_parent))
	other.targetDoor = id_door;
image_alpha = 0.5;
if (global.panic && (instance_exists(obj_lapjanitor) || !global.enablejerald))
	image_alpha = 1;
if ((global.lapcount >= 2 && global.inflapping == 0) || (global.lapcount >= 4 && global.inflapping == 2) || (global.levelname == "yogurt"))
	instance_destroy()
	