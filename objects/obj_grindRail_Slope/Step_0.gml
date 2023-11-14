with (obj_player)
{
	if (state != states.noclip && state != states.cotton && state != states.cottondrill && state != states.cottonroll && state != states.tumble && state != states.machroll && state != states.crouchslide && state != states.backbreaker && state != states.frostburnbump && state != states.bump && state != states.actor && state != states.frozen)
	{
		if (place_meeting_slopePlatform(x, y + 1, other) && vsp >= 0 && state != states.frostburn && state != states.grind)
		{
			state = states.grind;
			vsp = 0;
		}
	}
}
