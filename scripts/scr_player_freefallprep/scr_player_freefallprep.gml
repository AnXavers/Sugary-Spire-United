function state_player_freefallprep()
{
	hsp = 0;
	start_running = 1;
	alarm[4] = 14;
	jumpAnim = 1;
	dashAnim = 1;
	landAnim = 0;
	machslideAnim = 1;
	moveAnim = 1;
	stopAnim = 1;
	crouchslideAnim = 1;
	crouchAnim = 1;
	if (sprite_index != spr_pizzelle_bodyslamstart)
	{
		if (!global.treat)
			sprite_index = spr_pizzelle_groundpoundprep;
		else
			sprite_index = spr_donutSlam_intro;
	}
	move = key_left + key_right;
	if (character == "N")
		vsp = 0;
	if (scr_solid(x + move, y, true) && move != 0)
		movespeed = 0;
	if (!grounded)
	{
		hsp = move * movespeed;
		if (move != xscale && momemtum == 1 && movespeed != 0)
			movespeed -= 0.05;
		if (movespeed == 0)
			momemtum = 0;
		if ((move == 0 && momemtum == 0) || scr_solid(x + hsp, y))
		{
			movespeed = 0;
			mach2 = 0;
		}
		if (move != 0 && movespeed < 7)
			movespeed += 0.25;
		if (movespeed > 7)
			movespeed -= 0.05;
		if ((scr_solid(x + 1, y) && move == 1) || (scr_solid(x - 1, y) && move == -1))
			movespeed = 0;
		if (dir != xscale)
		{
			mach2 = 0;
			dir = xscale;
			movespeed = 0;
		}
		if (move == -xscale)
		{
			mach2 = 0;
			movespeed = 0;
			momemtum = 0;
		}
		if (move != 0)
			xscale = move;
	}
	image_speed = 0.5;
	if (floor(image_index) == (image_number - 1))
	{
		verticalMovespeed = 15;
		if (character == "N")
			verticalMovespeed = 23;
		vsp = verticalMovespeed;
		state = states.freefall;
		freefallsmash = 0;
	}
}
