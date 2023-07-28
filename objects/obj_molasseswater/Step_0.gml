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
					if (state == states.cotton || state == states.cottondrill)
						instance_create(x, y, obj_poofeffect);
					scr_playerrespawn(false);
				}
			}
		}
	}
}
