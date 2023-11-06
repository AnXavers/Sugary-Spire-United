if (active && other.state != 149 && other.state != states.frozen && other.state != states.hurt && other.state != states.bump)
{
	with (other)
	{
		if (state == states.climbwall)
			state = states.mach2;
		scr_taunt_storeVariables();
		state = 149;
		webID = other.id;
	}
}
