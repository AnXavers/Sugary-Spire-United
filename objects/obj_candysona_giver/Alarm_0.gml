collect -= 10;
global.collect += 10;
audio_stop_sound(sound_points);
var a = scr_sound(sound_points);
audio_sound_pitch(a, random_range(0.95, 1.1));
instance_create(x + random_range(-20, 20), y + random_range(-20, 20), obj_collecteffect);
if (collect > 0)
	alarm[0] = 5;
else
	instance_destroy();
