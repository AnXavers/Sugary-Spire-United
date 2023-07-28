if (activetimer == 0)
{
	with (other)
	{
		if (key_jump && (state == 60 || state == 68 || state == 69 || state == 70 || state == 119) && !grounded)
		{
			if (!(state == 60 || state == 68 || state == 69 || state == 70 || state == 119))
				state = 60;
			jumpAnim = 0;
			jumpstop = 0;
			vsp = -11;
			image_index = 0;
			scr_sound(sound_jump);
			other.activetimer = 100;
			scr_sleep(100);
		}
	}
}
