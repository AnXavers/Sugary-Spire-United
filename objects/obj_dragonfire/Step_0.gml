if (place_meeting(x, y, obj_player))
{
	with (obj_player)
	{
		sprite_index = obj_player.spr_fireass;
		state = states.fireass;
		image_index = 0;
		vsp = -20;
		audio_stop_sound(obj_player.sfx_fireass);
		scr_sound(obj_player.sfx_fireass);
	}
}
