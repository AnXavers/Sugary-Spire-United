with (obj_player)
{
	if (key_up && !place_meeting_collision(x, round(y), 12) && (state == 1 || state == 89 || state == 69 || state == 70 || state == 68 || state == 25 || state == 60 || state == 27 || state == 106) && state != 73 && state != 71 && state != 74 && state != 75)
	{
		hsp = 0;
		vsp = 0;
		mach2 = 0;
		state = 59;
		y = round(y);
		if ((y % 2) == 1)
			y -= 1;
	}
}
