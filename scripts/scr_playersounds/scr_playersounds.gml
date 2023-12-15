function scr_playersounds_init()
{
	machSound = -4;
	grindsnd = -4;
	suplexsnd = -4;
	flipsnd = -4;
}
function scr_playersounds()
{
	if (sprite_index == spr_tumblestart && floor(image_index) >= 11 && !audio_is_playing(sound_tumblestart) && !audio_is_playing(sound_tumble))
		scr_sound(sound_tumble);
	if ((sprite_index == spr_tumble || sprite_index == spr_machroll) && !audio_is_playing(sound_tumblestart) && !audio_is_playing(sound_tumble))
		scr_sound(sound_tumble);
			if (sprite_index == spr_mach3roll && !audio_is_playing(sound_tumblestart) && !audio_is_playing(sound_tumble))
		scr_sound(sound_tumble);
	if (state != states.tumble && (sprite_index != spr_machroll || sprite_index != spr_mach3roll  || sprite_index != spr_mach3rollstart))
	{
		audio_stop_sound(sound_tumble);
		audio_stop_sound(sound_tumblestart);
	}
	if ((state == states.minecart && grounded) || state == states.grind)
	{
		if (!audio_is_playing(grindsnd))
			grindsnd = scr_soundloop(sfx_railgrind);
	}
	else if (audio_is_playing(grindsnd))
		audio_stop_sound(grindsnd);
	if (audio_is_playing(suplexsnd) && state != states.handstandjump)
		audio_stop_sound(suplexsnd);
	if (sprite_index == spr_mach2jump)
	{
		if (!audio_is_playing(flipsnd))
			flipsnd = scr_soundloop(sfx_flip);
	}
	else if (audio_is_playing(flipsnd))
		audio_stop_sound(flipsnd);
	if (state == states.mach2 || state == states.mach3 || state == states.climbwall || state == states.climbceiling || state == states.climbdownwall || state = states.pizzano_rocketfist || sprite_index = spr_mach3roll)
	{
		var machsnd = -4;
		if (state == states.mach2 && sprite_index == spr_mach1 && grounded || (state = states.pizzano_rocketfist && sprite_index == spr_superjump_cancelprep))
			machsnd = global.sfxdash1;
		else if ((state == states.mach2 && sprite_index == spr_mach2) || (state == states.climbwall || state == states.climbceiling || state == states.climbdownwall))
			machsnd = global.sfxdash2;
		else if (state == states.mach3 && sprite_index != spr_crazyrun || state = states.pizzano_rocketfist || (sprite_index = spr_mach3roll && character == "P" && global.newplayeranim = 1))
			machsnd = global.sfxdash3;
		else if (sprite_index == spr_crazyrun)
			machsnd = global.sfxdash4;
		if (!audio_is_playing(machsnd))
		{
			audio_stop_sound(machSound);
			machSound = scr_soundloop(machsnd);
		}
	}
	else if (audio_is_playing(machSound))
		audio_stop_sound(machSound);
}
