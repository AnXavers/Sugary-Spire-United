if (!global.freezeframe)
{
	if shattedBy != obj_donutChomperSpitter
		vsp = 14;
	grav = 0
	if (scr_solid(x, y + 1) && !place_meeting(x, y + 1, obj_destructibles) && !place_meeting(x, y + 1, obj_metalblock)) || (vspeed == 0 && hspeed == 0)
		instance_destroy();
}
