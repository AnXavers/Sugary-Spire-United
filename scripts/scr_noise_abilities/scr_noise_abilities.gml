function scr_noise_abilities()
{
	if (character == "T" && key_shoot2 && !instance_exists(obj_noisebomb) && !instance_exists(obj_bombexplosionnoise))
	{
		with (instance_create(x, y, obj_noisebomb))
		{
			image_xscale = other.xscale;
			hspeed = other.xscale * 9;
			movespeed = 10;
			if (!obj_player.key_up)
				vspeed = -8;
			else
				vspeed = -10;
		}
		scr_sound(sound_enemythrow);
	}
}