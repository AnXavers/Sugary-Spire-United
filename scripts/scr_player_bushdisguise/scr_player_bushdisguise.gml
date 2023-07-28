function state_player_bushdisguise()
{
	hsp = 0;
	image_speed = 0.35;
	if (shaketime > 0)
		shaketime--;
	if (key_jump && shaketime < 6)
	{
		bushdetection -= 1;
		shaketime = 12;
		sprite_index = spr_player_frothstuck_start;
		image_index = 0;
	}
	if (animation_end() && sprite_index == spr_player_frothstuck_start)
		sprite_index = spr_player_frothstuck;
	if (bushdetection <= 0)
	{
		state = 1;
		sprite_index = spr_idle;
		x = player_x;
		instance_create(x, y, obj_snowpoofeffect);
		bushdetection = 0;
	}
}
