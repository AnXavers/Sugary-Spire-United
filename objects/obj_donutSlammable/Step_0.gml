if (!global.freezeframe)
{
	vsp = 14;
	if (scr_solid(x, y + 1) && !place_meeting(x, y + 1, obj_destructibles) && !place_meeting(x, y + 1, obj_metalblock))
		instance_destroy();
}
