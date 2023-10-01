audio_stop_sound(sound_treasuregot);
scr_sound(sound_treasuregot);
scr_ghostcollectible();
scr_queue_tvanim(obj_tv.happytvspr, 200);
global.collect += 3000;
global.pizzameter += 5;
create_small_number(x, y, "3000");
global.combofreeze = 30;
global.combotime = 60;
global.treasure = 1;
repeat (15)
	instance_create(((x + random_range(-60, 60)) - 16), ((y + random_range(-60, 60)) - 16), obj_collecteffect)
instance_destroy();
