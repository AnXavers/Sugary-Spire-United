if global.lapmode == 3
	instance_destroy();
with (instance_place(x, y, obj_doortrigger_parent))
	other.targetDoor = id_door;
image_alpha = 0.5;
if ((global.panic || global.levelname == "secrets") && (global.enableportal == 2 || !global.jerald))
	image_alpha = 1;
if ((global.lapcount >= 2 && global.lapmode == 0) || (global.lapcount >= 5 && global.lapmode == 2) || (global.levelname == "yogurt"))
	instance_destroy()
	