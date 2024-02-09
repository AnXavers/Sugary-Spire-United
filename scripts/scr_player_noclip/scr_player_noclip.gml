function state_player_noclip()
{
	vsp = 0;
	hsp = 0;
	prevVsp = 0;
	prevHsp = 0;
	hspCarry = 0;
	vspCarry = 0;
	move = key_left + key_right;
	sprite_index = spr_pizzelle_idle;
	if (key_sprint)
		movespeed = 18;
	else if (key_attack)
		movespeed = 6;
	else
		movespeed = 12;
	if (key_jump)
		state = 1;
	x += (move * movespeed);
	if (key_up)
		y -= movespeed;
	else if (key_down)
		y += movespeed;
}
