function state_player_tackle()
{
	combo = 0;
	movespeed = 0;
	mach2 = 0;
	start_running = 1;
	if (grounded && vsp > 0)
		hsp = 0;
	jumpAnim = 1;
	dashAnim = 1;
	landAnim = 0;
	moveAnim = 1;
	stopAnim = 1;
	crouchslideAnim = 1;
	crouchAnim = 1;
	if (animation_end())
	{
		if (key_attack && grounded)
		{
			mach2 = 0;
			if (movespeed < 6)
				movespeed = 6;
			sprite_index = spr_mach1;
			jumpAnim = 1;
			state = 69;
			image_index = 0;
		}
		else
			state = 1;
	}
	image_speed = 0.5;
}
