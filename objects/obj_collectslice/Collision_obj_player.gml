global.collect += 25;
global.combofreeze = clamp(global.combofreeze + 8, 0, 30);
global.combotime += 30;
create_small_number(x, y, "25");
audio_stop_sound(sound_points);
scr_sound(sound_points);
repeat (3)
	instance_create(((x + random_range(-5, 5)) - 16), ((y + random_range(-5, 5)) - 16), obj_collecteffect)
instance_destroy();
