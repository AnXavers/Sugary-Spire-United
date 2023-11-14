function scr_enemy_slugparry()
{
	if (substate == 1)
	{
		hsp = movespeed * image_xscale;
		if (movespeed < 0 && grounded)
			movespeed += 0.2;
		if (movespeed > 0)
			movespeed = 0;
		image_speed = 0.35;
		if (animation_end())
		{
			substate = substates.unknown_0;
			bombreset = 100;
			state = 3;
			sprite_index = spr_meloncoolwalk;
			movespeed = 1;
		}
	}
	else
	{
		image_speed = 0;
		movespeed = 0;
		hsp = 0;
		taunttimer--;
		if (taunttimer <= 0)
		{
			substate = substates.unknown_0;
			bombreset = 100;
			state = 3;
			sprite_index = spr_meloncoolwalk;
			movespeed = 1;
		}
	}
}
