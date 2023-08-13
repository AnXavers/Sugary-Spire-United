if (state == 0 && other.state != 62 && other.hsp == 0 && other.grounded && other.key_up2)
{
	if selected != 6
	{
		state = 1;
		playerID = other.id;
		other.state = 110;
		other.key_up2 = 0;
		other.movespeed = 0;
		other.hsp = 0;
		other.sprite_index = other.spr_idle;
		other.image_speed = 0.35;
	}
	else
	{
		scr_sound(sound_enemythrow);
		targetRoom = inbetweencutscene
	}
}
