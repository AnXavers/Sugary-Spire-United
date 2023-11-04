audio_stop_sound(sfx_tauntpizzano1);
audio_stop_sound(sfx_tauntpizzano2);
audio_stop_sound(sfx_tauntpizzano3);
audio_stop_sound(sfx_tauntpizzano4);
audio_stop_sound(sfx_tauntpizzano5);
audio_stop_sound(sfx_tauntpizzano6);
audio_stop_sound(sfx_tauntpizzano7);
audio_stop_sound(sfx_tauntpizzano8);
var tauntsound = asset_get_index("sfx_tauntpizzano" + irandom_range(1, 8));
if (bbox_in_camera(view_camera[0]))
	scr_sound(tauntsound);
image_speed = 0.5;
