with (obj_player)
{
	if (state != states.noclip && state != states.cotton && state != states.cottondrill && state != states.frostburnbump && state != states.cottonroll && state != states.tumble && state != states.machroll && state != states.crouchslide && state != states.backbreaker && state != states.bump && state != states.actor && state != 0)
	{
		if (place_meeting_platform(x, y + 1, other) && vsp >= 0 && state != states.frostburn && state != states.grind)
		{
			state = states.grind;
			vsp = 0;
		}
	}
}
