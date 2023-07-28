if (place_meeting(x, y + vsp + grav, obj_player))
{
	DestroyedBy = obj_player;
	event_user(0);
}
if (place_meeting(x, y + vsp + grav, obj_baddie))
{
	DestroyedBy = obj_player;
	event_user(0);
}
