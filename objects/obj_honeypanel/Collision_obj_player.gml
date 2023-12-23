if (active && other.state != states.honey && other.state != states.frozen && other.state != states.hurt && other.state != states.bump)
{
	with (other)
	{
		if (state == states.climbwall)
			state = states.mach2;
		scr_taunt_storeVariables();
		state = states.honey;
		scr_sound(sfx_honeysplat)
		webID = other.id;
	}
}
