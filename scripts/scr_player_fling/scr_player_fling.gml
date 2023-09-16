function state_player_fling()
{
	image_speed = 0.35;
	if (sprite_index == obj_player.spr_candybegin && animation_end())
		sprite_index = obj_player.spr_candyidle;
}
