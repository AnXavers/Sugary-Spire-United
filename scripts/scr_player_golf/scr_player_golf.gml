function state_player_golf()
{
	move = key_left + key_right;
	if (move != 0)
		move = xscale;
	hsp = 0;
	vsp = 0;
	if (sprite_index != spr_player_grab)
		sprite_index = spr_player_swingding;
	else if (animation_end())
		state = 1;
	if (key_slap2)
	{
		image_index = 0;
		sprite_index = spr_player_swingdingend;
		instance_create(x, y, obj_slaphitbox);
	}
}
