audio_stop_sound(sound_taunt1);
audio_stop_sound(sound_taunt2);
audio_stop_sound(sound_taunt3);
audio_stop_sound(sound_taunt4);
audio_stop_sound(sound_taunt5);
audio_stop_sound(sound_taunt6);
audio_stop_sound(sound_taunt7);
audio_stop_sound(sound_taunt8);
if obj_player.character == "P"
{
	tauntsound = choose(sound_taunt1, sound_taunt2, sound_taunt3, sound_taunt4, sound_taunt5, sound_taunt6, sound_taunt7);
	if chance(0.01)
		tauntsound = sfx_goofytaunt
}
else if obj_player.character == "N"
	tauntsound = choose(sfx_tauntpizzano1, sfx_tauntpizzano2, sfx_tauntpizzano3, sfx_tauntpizzano4, sfx_tauntpizzano5, sfx_tauntpizzano6, sfx_tauntpizzano7, sfx_tauntpizzano8);
else if (obj_player.character == "T" || obj_player.character == "S")
	tauntsound = sound_tauntpeppino
else
	tauntsound = choose(sound_tauntextra1, sound_tauntextra2)
scr_sound(tauntsound);
image_speed = 0.5;
depth = -1
if (global.panic = 1 && global.exitgatetaunt < 10 && place_meeting(x, y, obj_exitgate))
{
	instance_create(x, y, obj_20)
	global.collect += 20
	global.exitgatetaunt += 1
}