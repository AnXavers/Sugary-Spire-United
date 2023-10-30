with (other)
{
	if (state != states.noclip && state != states.fling && !global.freezeframe && vsp >= 0 && !instance_exists(obj_backtostart))
	{
		instance_create(x, y, obj_backtostart)
		sprite_index = obj_player.spr_fireass;
		state = states.fireass;
		image_index = 0;
		vsp = -20;
		audio_stop_sound(sound_fireass);
		scr_sound(sound_fireass);
	}
}