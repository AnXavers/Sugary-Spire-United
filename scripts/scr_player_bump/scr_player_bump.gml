function state_player_bump()
{
	movespeed = 0;
	mach2 = 0;
	start_running = 1;
	alarm[4] = 14;
	if ((sprite_index != spr_catched && sprite_index != spr_splat && (sprite_index != spr_tumbleend && sprite_index != spr_mach3hitwall)) && sprite_index != spr_pizzano_shoulderbash)
		sprite_index = spr_bump;
	if (sprite_index == spr_splat)
	{
		hsp = 0;
		vsp = 0;
	}
	else if (grounded && vsp > 0)
		hsp = 0;
	if (animation_end())
	{
		state = states.jump;
		sprite_index = spr_pizzelle_jump;
	}
	if (audio_is_playing(sound_tumble))
		audio_stop_sound(sound_tumble);
	image_speed = 0.35;
}
