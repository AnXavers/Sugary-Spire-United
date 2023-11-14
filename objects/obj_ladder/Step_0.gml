if (place_meeting(x, y - 1, obj_player))
{
	with (obj_player)
	{
		if (place_meeting(x, y + 1, obj_ladder) && grounded && !place_meeting_collision(other.x + (other.sprite_width / 2), round(y + 5), 12) && key_down && state == states.crouch)
		{
			hsp = 0;
			vsp = 0;
			y += 5;
			state = states.ladder;
			x = other.x + (other.sprite_width / 2);
			y = round(y);
			if ((y % 2) == 1)
				y--;
		}
	}
}
