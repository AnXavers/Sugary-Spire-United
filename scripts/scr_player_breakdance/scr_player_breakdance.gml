function state_player_breakdance()
{
	movespeed = 0;
	hsp = 0;
	hsp = xscale;
	hsp *= 2;
	if (sprite_index == spr_player_breakdancebeach && floor(image_index) >= (image_number - 1))
	{
		state = 1;
		sprite_index = spr_player_idle;
	}
}
