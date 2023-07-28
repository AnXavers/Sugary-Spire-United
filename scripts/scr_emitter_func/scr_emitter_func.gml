function create_emitter(argument0 = x, argument1 = y, argument2 = 500, argument3 = 1200, argument4 = 2)
{
	var myemit = audio_emitter_create();
	audio_emitter_falloff(myemit, argument2, argument3, argument4);
	audio_emitter_position(myemit, argument1, argument0, 0);
	return myemit;
}
function play_sfx(argument0, argument1, argument2 = false, argument3 = 0, argument4 = 1, argument5 = 1)
{
	if (audio_emitter_exists(argument0))
		return audio_play_sound_on(argument0, argument1, argument2, argument3, argument4, undefined, argument5);
	else
	{
		argument0 = create_emitter();
		return audio_play_sound_on(argument0, argument1, argument2, argument3, argument4, undefined, argument5);
	}
}
