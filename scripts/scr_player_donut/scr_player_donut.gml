function state_player_donut()
{
	landAnim = 0;
	hsp = xscale * movespeed;
	if (grounded)
		movespeed = approach(movespeed, 0, 0.1);
	sprite_index = spr_player_throwDonut;
	if (animation_end())
	{
		if (key_attack && movespeed >= 10)
		{
			state = 69;
			if (movespeed < 10)
				movespeed = 10;
		}
		else if (scr_solid(x, y - 3))
		{
			state = 65;
			landAnim = 0;
			image_index = 0;
			idle = 0;
		}
		else
		{
			image_index = 0;
			state = 1;
		}
	}
	image_speed = 0.4;
}
