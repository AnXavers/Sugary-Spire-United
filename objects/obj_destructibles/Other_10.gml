p1Vibration(5, 5);
instance_destroy();
var _par = object_get_parent(object_index)
if (chance(0.015) && _par != par_clutterDestroyable && _par != obj_gummyharry && global.levelname != "none")
	instance_create(x, y, obj_peppermintcoin)