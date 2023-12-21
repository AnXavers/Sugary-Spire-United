p1Vibration(5, 5);
instance_destroy();
var _par = object_get_parent(self)
if (chance(0.005) && _par != par_clutterDestroyable && _par != obj_gummyharry)
	instance_create(x, y, obj_peppermintcoin)