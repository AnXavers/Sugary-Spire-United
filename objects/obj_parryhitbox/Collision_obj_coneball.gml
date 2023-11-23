if global.coneballparry == 1
{
	audio_stop_sound(sound_parry);
	scr_sound(sound_parry);
	with obj_coneball
	{
		coneballspeed = -2
		alarm[1] = 10
	}
	with (obj_player)
	{
		state = 93;
		sprite_index = choose(spr_parry1, spr_parry2, spr_parry3);
		image_index = 0;
		movespeed = -8;
		flash = 1;
		with (instance_create(x, y, obj_bangeffect))
			sprite_index = spr_parryeffect;
	}
}