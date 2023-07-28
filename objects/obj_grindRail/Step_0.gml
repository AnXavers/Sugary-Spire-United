with (obj_player)
{
	if (state != 128 && state != 88 && state != 97 && state != 143 && state != 98 && state != 96 && state != 31 && state != 67 && state != 45 && state != 72 && state != 110 && state != 0)
	{
		if (place_meeting_platform(x, y + 1, other) && vsp >= 0 && state != 140 && state != 39)
		{
			state = 39;
			vsp = 0;
		}
	}
}
