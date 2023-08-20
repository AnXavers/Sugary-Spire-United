random_index = irandom_range(0,100);
if random_index = 100
{
	audio_stop_sound(sound_parry);
	draw_set_alpha(global.sugarcoatfade)
	scr_sound(sound_sugarcoat)
	global.sugarcoatfade -= 0.1
}
