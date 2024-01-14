function scr_pizzano_shoulderbash()
{
	hsp = xscale * movespeed;
	if (key_jump && grounded)
	{
		state = states.pizzano_twirl;
		vsp = -12;
	}
	if ((scr_solid(x + xscale, y) && !place_meeting(x + sign(hsp), y, obj_slope)) && !place_meeting(x + xscale, y, obj_destructibles))
	{
		movespeed = -3.5;
		vsp = -8;
		mach2 = 0;
		state = states.bump;
		image_index = 0;
		machslideAnim = 1;
		machhitAnim = 0;
		instance_create(x + 10, y + 10, obj_bumpeffect);
		if (audio_is_playing(sound_suplex1))
			audio_stop_sound(sound_suplex1);
		scr_sound(sound_bump);
	}
	if (key_sprint && grounded)
	{
		flash = 1;
		state = states.mach2;
		image_index = 0;
		sprite_index = spr_mach2;
		jumpstop = 0;
	}
}
