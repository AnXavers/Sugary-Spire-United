if (!global.freezeframe)
{
	hsp = Hmovespeed;
	vsp = Vmovespeed;
	if (place_meeting_collision(x + sign(hsp), y + sign(vsp)) && !place_meeting(x + sign(hsp), y + sign(vsp), obj_destructibles) && (!place_meeting(x + sign(hsp), y + sign(vsp), obj_metalblock) || !bigShot))
		instance_destroy();
}
