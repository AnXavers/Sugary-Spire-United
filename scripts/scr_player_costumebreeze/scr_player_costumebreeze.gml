function state_player_costumebreeze()
{
	hsp = xscale * move;
	move = key_left + key_right;
	movespeed = approach(movespeed, 0, 0.2);
	breezecooldown--;
	if (breezecooldown <= 0 || movespeed == 0)
		state = states.costumenormal;
}
