function state_player_coasterpeep()
{
	if (dir == 0)
	{
		hsp = 2;
		vsp = -2;
	}
	if (dir == 1)
	{
		hsp = 2;
		vsp = 2;
	}
	if (grounded == 1)
	{
		vsp = 0;
		hsp = 5;
	}
}
