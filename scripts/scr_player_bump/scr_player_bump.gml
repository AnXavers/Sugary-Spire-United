function state_player_bump()
{
	movespeed = 0;
	mach2 = 0;
	start_running = 1;
	alarm[4] = 14;
	if ((sprite_index != spr_player_catched && sprite_index != spr_splat && (sprite_index != spr_tumbleend && sprite_index != spr_mach3hitwall)) && sprite_index != spr_pizzano_shoulderbash)
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
		state = 60;
		sprite_index = spr_jump;
		if (shotgunAnim == 1)
			sprite_index = spr_shotgun_jump;
	}
	if (audio_is_playing(sound_tumble))
		audio_stop_sound(sound_tumble);
	image_speed = 0.35;
}
