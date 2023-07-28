if (delay <= 0)
{
	with (obj_player)
	{
		if (state != states.ufofloat && state != states.ufodash)
		{
			state = states.ufofloat;
			movespeed = other.sethsp;
			verticalMovespeed = other.setvsp;
			ufotimer = 750;
		}
	}
}
