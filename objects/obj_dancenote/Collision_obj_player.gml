if (activetimer == 0)
{
	with (other)
	{
		if (key_jump && (state == states.jump || state == states.mach1 || state == states.mach2 || state == states.mach3 || state == states.pizzano_twirl) && !grounded)
		{
			if (!(state == states.jump || state == states.mach1 || state == states.mach2 || state == states.mach3 || state == states.pizzano_twirl))
				state = states.jump;
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
