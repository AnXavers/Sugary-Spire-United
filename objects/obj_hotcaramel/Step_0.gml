if (place_meeting(x, y - 1, obj_player))
{
	with (obj_player)
	{
		if (state != 128 && !global.freezeframe)
		{
			if (state == 88 || state == 97)
				instance_create(x, y, obj_poofeffect);
			sprite_index = spr_player_fireass;
			state = 108;
			image_index = 0;
			vsp = -20;
			audio_stop_sound(sound_fireass);
			scr_sound(sound_fireass);
		}
	}
}
