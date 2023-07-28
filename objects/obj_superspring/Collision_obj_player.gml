with (obj_player)
{
	if (state != 63 && state != 74)
	{
		scr_sound(sound_superjumprelease);
		other.image_index = 0;
		other.image_speed = 0.35;
		x = other.x;
		if (other.image_yscale == 1)
		{
			sprite_index = spr_player_superjump;
			state = 63;
			vsp = -12;
			movespeed = 12;
			freefallsmash = 0;
		}
		else
		{
			state = 74;
			verticalMovespeed = 10;
			freefallsmash = 0;
			sprite_index = spr_player_outofcontrolfall;
		}
	}
}
