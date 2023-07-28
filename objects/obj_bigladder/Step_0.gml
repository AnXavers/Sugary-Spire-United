if (place_meeting(x, y - 1, obj_player))
{
	with (obj_player)
	{
		if (place_meeting(x, y + 1, obj_ladder) && grounded && !place_meeting_collision(x, round(y + 5), 12) && key_down && state == 65)
		{
			hsp = 0;
			vsp = 0;
			y += 5;
			state = 59;
			y = round(y);
			if ((y % 2) == 1)
				y -= 1;
		}
	}
}
