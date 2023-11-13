with (obj_player)
{
	if (state != 128 && state != 88 && state != 97 && state != states.frostburnbump && state != 98 && state != 96 && state != states.machroll && state != 67 && state != 45 && state != 72 && state != 110 && state != 0)
	{
		if (place_meeting_platform(x, y + 1, other) && vsp >= 0 && state != states.frostburn && state != states.grind)
		{
			state = states.grind;
			vsp = 0;
		}
	}
}
