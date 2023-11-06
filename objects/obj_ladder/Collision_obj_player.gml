with (obj_player)
{
	if (key_up && !place_meeting_collision(other.x + (other.sprite_width / 2), round(y), 12) && (state == states.normal || state == states.uppercut || state == states.mach2 || state == states.mach3 || state == states.mach1 || state == 25 || state == states.jump || state == 27 || state == states.pizzano_kungfu) && state != 73 && state != 71 && state != 74 && state != 75)
	{
		hsp = 0;
		vsp = 0;
		mach2 = 0;
		state = 59;
		x = other.x + (other.sprite_width / 2);
		y = round(y);
		if ((y % 2) == 1)
			y--;
	}
}
