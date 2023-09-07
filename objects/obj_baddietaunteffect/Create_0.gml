audio_stop_sound(sfx_tauntpizzano1);
audio_stop_sound(sfx_tauntpizzano2);
audio_stop_sound(sfx_tauntpizzano3);
audio_stop_sound(sfx_tauntpizzano4);
audio_stop_sound(sfx_tauntpizzano5);
audio_stop_sound(sfx_tauntpizzano6);
audio_stop_sound(sfx_tauntpizzano7);
audio_stop_sound(sfx_tauntpizzano8);
var tauntsound = choose(sfx_tauntpizzano1, sfx_tauntpizzano2, sfx_tauntpizzano3, sfx_tauntpizzano4, sfx_tauntpizzano5, sfx_tauntpizzano6, sfx_tauntpizzano7, sfx_tauntpizzano8);
if (bbox_in_camera(view_camera[0]))
	scr_sound(tauntsound);
image_speed = 0.5;
