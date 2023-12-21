scr_collision();
if (place_meeting_solid(x + sign(xscale), y, obj_solid) && (!place_meeting_slope(x + sign(xscale), y + 1)) || (place_meeting(x + sign(xscale), y, obj_destructibles) || place_meeting(x + sign(xscale), y, obj_chocofrog)) || place_meeting_solid(x + sign(xscale), y, obj_hallway))
	xscale = -xscale
hsp = movespeed * xscale
grace--