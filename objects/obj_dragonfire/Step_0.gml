if (place_meeting(x, y, obj_player))
{
	with (obj_player)
	{
		sprite_index = spr_player_fireass;
		state = states.fireass;
		image_index = 0;
		vsp = -20;
		audio_stop_sound(sound_fireass);
		scr_sound(sound_fireass);
	}
}
