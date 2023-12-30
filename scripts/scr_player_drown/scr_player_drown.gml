function state_player_drown()
{;
	vsp = lerp(vsp, 1, 0.05)
	hsp = round(lerp(0, hsp, 0.15));
	if (animation_end() || key_down)
		scr_playerrespawn(false);
	if (key_jump && !key_down)
	{
		scr_sound(sound_jump);
		sprite_index = spr_drown_jump;
		instance_create(x, y, obj_highjumpcloud2);
		vsp = -12;
		state = states.jump;
		image_index = 0;
	}
	image_speed = 0.35;
}
