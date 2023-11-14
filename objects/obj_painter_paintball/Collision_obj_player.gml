with (obj_player)
{
	player_x = x;
	state = states.bushdisguise;
	sprite_index = spr_frothstuck;
	bushdisguise = 0;
	bushdetection = 12;
	hp--;
}
instance_destroy();
