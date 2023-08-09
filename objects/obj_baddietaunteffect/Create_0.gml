audio_stop_sound(sound_tauntpizzano1);
audio_stop_sound(sound_tauntpizzano2);
audio_stop_sound(sound_tauntpizzano3);
audio_stop_sound(sound_tauntpizzano4);
audio_stop_sound(sound_tauntpizzano5);
audio_stop_sound(sound_tauntpizzano6);
audio_stop_sound(sound_tauntpizzano7);
audio_stop_sound(sound_tauntpizzano8);
var tauntsound = choose(sound_tauntpizzano1, sound_tauntpizzano2, sound_tauntpizzano3, sound_tauntpizzano4, sound_tauntpizzano5, sound_tauntpizzano6, sound_tauntpizzano7, sound_tauntpizzano8);
if (bbox_in_camera(view_camera[0]))
	scr_sound(tauntsound);
image_speed = 0.5;
