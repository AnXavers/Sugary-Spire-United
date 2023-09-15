if (place_meeting(x, y, obj_player))
{
	with (obj_player)
	{
		if (place_meeting(x, y, other))
		{
			if (state != states.noclip && !global.freezeframe)
			{
				if (vsp >= 0)
				{
					instance_create(x, y, obj_backtostart)
				}
			}
		}
	}
}
