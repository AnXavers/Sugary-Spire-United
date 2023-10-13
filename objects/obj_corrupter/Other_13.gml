/// @description Replace random sfx with random sfx
var sfx = irandom((array_length(global.audiolist) - 1))
if audio_is_playing(sfx)
{
	audio_stop_sound(sfx)
	var sfx = irandom((array_length(global.audiolist) - 1))
	scr_sound(sfx)
}