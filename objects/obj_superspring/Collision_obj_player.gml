with (obj_player)
{
	if (state != states.Sjump && state != states.freefall)
	{
		scr_sound(sound_superjumprelease);
		scr_sound(sfx_coneballspike);
		other.image_index = 0;
		other.image_speed = 0.35;
		x = other.x;
		if (other.image_yscale == 1)
		{
			sprite_index = spr_superjump;
			state = states.Sjump;
			vsp = -12;
			movespeed = 12;
			freefallsmash = 0;
		}
		else
		{
			state = states.freefall;
			verticalMovespeed = 10;
			freefallsmash = 0;
			sprite_index = spr_outofcontrolfall;
		}
	}
}
