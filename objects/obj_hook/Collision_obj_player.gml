if (state == 0)
{
	if (other.state != states.hooks && other.state != states.frozen && other.state != states.noclip && other.state != states.backbreaker)
	{
		with (other)
		{
			other.x = other.xstart;
			other.y = other.ystart;
			scr_taunt_storeVariables();
			state = states.hooks;
		}
		state = 2;
	}
}
