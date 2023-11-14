if (theifsubstate == 2)
{
	audio_stop_sound(sound_parry);
	scr_sound(sound_parry);
	instance_destroy();
	with (obj_baddie)
	{
		if (distance_to_object(other.id) < 64 && (object_index != obj_charcherry || (object_index == obj_charcherry && state == 16)))
			instance_destroy();
	}
	with (obj_player)
	{
		state = states.parry;
		sprite_index = choose(spr_parry1, spr_parry2, spr_parry3);
		image_index = 0;
		movespeed = -8;
		flash = 1;
		with (instance_create(x, y, obj_bangeffect))
			sprite_index = spr_parryeffect;
	}
}
