audio_stop_sound(sound_taunt1);
audio_stop_sound(sound_taunt2);
audio_stop_sound(sound_taunt3);
audio_stop_sound(sound_taunt4);
audio_stop_sound(sound_taunt5);
audio_stop_sound(sound_taunt6);
audio_stop_sound(sound_taunt7);
audio_stop_sound(sound_taunt8);
if (obj_player.character == "P")
	tauntsound = choose(127, 45, 163, 210, 9, 23, 11);
else
	tauntsound = choose(151, 17, 199, 188, 196, 30, 64, 198);
scr_sound(tauntsound);
image_speed = 0.5;
