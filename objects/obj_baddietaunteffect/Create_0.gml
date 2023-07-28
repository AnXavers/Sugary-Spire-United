audio_stop_sound(sound_taunt1);
audio_stop_sound(sound_taunt2);
audio_stop_sound(sound_taunt3);
audio_stop_sound(sound_taunt4);
audio_stop_sound(sound_taunt5);
audio_stop_sound(sound_taunt6);
audio_stop_sound(sound_taunt7);
audio_stop_sound(sound_taunt8);
var tauntsound = choose(127, 45, 163, 210, 9, 23, 11, 211);
if (bbox_in_camera(view_camera[0]))
	scr_sound(tauntsound);
image_speed = 0.5;
