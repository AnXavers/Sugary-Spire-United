function scr_noise_abilities()
{
	if ((obj_player.character == "T" ||obj_player.character == "PT") && key_shoot2 && !instance_exists(obj_noisebomb) && !instance_exists(obj_bombexplosionnoise))
	{
		sprite_index = spr_noise_noisebombthrow
		image_index = 0
		state = states.dynamite
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