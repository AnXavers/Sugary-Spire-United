audio_stop_sound(sound_taunt1);
audio_stop_sound(sound_taunt2);
audio_stop_sound(sound_taunt3);
audio_stop_sound(sound_taunt4);
audio_stop_sound(sound_taunt5);
audio_stop_sound(sound_taunt6);
audio_stop_sound(sound_taunt7);
audio_stop_sound(sound_taunt8);
if (obj_player.character == "P")
	tauntsound = choose(sound_taunt1, sound_taunt2, sound_taunt3, sound_taunt4, sound_taunt5, sound_taunt6, sound_taunt7);
else if (obj_player.character == "N")
	tauntsound = choose(sound_tauntpizzano1, sound_tauntpizzano2, sound_tauntpizzano3, sound_tauntpizzano4, sound_tauntpizzano5, sound_tauntpizzano6, sound_tauntpizzano7, sound_tauntpizzano8);
else if (obj_player.character == "T")
	tauntsound = sound_tauntpeppino
else
	tauntsound = choose(sound_tauntextra1, sound_tauntextra2)
random_index = irandom_range(0,100);
if random_index = 100
	tauntsound = sfx_goofytaunt
	scr_sound(tauntsound);
if (obj_player.character == "T" || obj_player.character == "S")
	audio_sound_pitch(tauntsound, irandom_range(0,2));
image_speed = 0.5;
if (global.panic = 1 && global.exitgatetaunt < 10 && place_meeting(x, y, obj_exitgate))
{
	instance_create(x, y, obj_20)
	global.collect += 20
	global.exitgatetaunt += 1
}