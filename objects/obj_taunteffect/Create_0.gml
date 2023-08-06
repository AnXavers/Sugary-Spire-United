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
else
	tauntsound = choose(sound_tauntpizzano1, sound_tauntpizzano2, sound_tauntpizzano3, sound_tauntpizzano4, sound_tauntpizzano5, sound_tauntpizzano6, sound_tauntpizzano7, sound_tauntpizzano8);
scr_sound(tauntsound);
image_speed = 0.5;
