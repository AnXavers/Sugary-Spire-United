if (scr_solid(x + sign(hsp), y, false) && !place_meeting(x + sign(hsp), y, obj_destructibles))
	instance_destroy();
x += (image_xscale * (hsp * 0.98));
instance_destroy(instance_place(x + hsp, y, obj_baddie));
instance_destroy(instance_place(x + sign(hsp), y, obj_baddie));
instance_destroy(instance_place(x + hsp, y, obj_chocofrog));
instance_destroy(instance_place(x + sign(hsp), y, obj_chocofrog));
