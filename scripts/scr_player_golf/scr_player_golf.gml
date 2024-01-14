function state_player_golf()
{
	move = key_left + key_right;
	if (move != 0)
		move = xscale;
	hsp = 0;
	vsp = 0;
	if (sprite_index != spr_grab)
		sprite_index = spr_swingding;
	else if (animation_end())
		state = 1;
	if (key_attack2)
	{
		image_index = 0;
		sprite_index = spr_swingdingend;
		instance_create(x, y, obj_slaphitbox);
	}
}
