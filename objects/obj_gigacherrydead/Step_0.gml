scr_collision();
hsp = image_xscale * movespeed;
instance_destroy(instance_place(x + hsp, y, obj_baddie));
instance_destroy(instance_place(x + hsp, y, obj_destructibles));
if (place_meeting_collision(x + image_xscale, y, 1) && (!groundedSlope || place_meeting_collision(x + sign(hsp), y - 16, 1)) && !place_meeting(x + sign(hsp), y, obj_destructibles))
	instance_destroy();
