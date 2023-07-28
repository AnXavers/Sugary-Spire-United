with (instance_nearest(x, y, obj_donutSlammable))
{
	if (place_meeting(x, y + vsp, other.id) || place_meeting(x, y + sign(vsp), other.id))
	{
		with (other.id)
		{
			DestroyedBy = other.id;
			event_user(0);
		}
		instance_destroy();
	}
}
