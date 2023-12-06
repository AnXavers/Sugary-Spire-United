audio_stop_sound(obj_player.sfx_collect);
audio_stop_sound(obj_player.sfx_collectmassive);
scr_sound(obj_player.sfx_collectmassive);
scr_sound(obj_player.sfx_collect);
scr_ghostcollectible();
global.collectsound = mu_entryway_title;
scr_queue_tvanim(obj_tv.happytvspr, 200);
global.collect += 1000;
global.pizzameter += 5;
create_small_number(x, y, "1000");
global.combofreeze = 30;
global.combotime = 60;
repeat (15)
	instance_create(((x + random_range(-60, 60)) - 16), ((y + random_range(-60, 60)) - 16), obj_collecteffect)
if global.newvoicelines
	scr_sound(choose(sfx_newcollect1p, sfx_newcollect2p, sfx_newcollect3p, sfx_newcollect4p))
instance_destroy();
