event_inherited();
collectvanish = false;
collectboxid = -4;
in_the_void = false;
global.collected = 0;
global.collectsound = mu_entryway_title;
if obj_player.character = "T"
	sprite_index = choose(obj_player.spr_bigcollect1, obj_player.spr_bigcollect2, obj_player.spr_bigcollect3, obj_player.spr_bigcollect4, obj_player.spr_bigcollect5);
else
	sprite_index = choose(obj_player.spr_bigcollect1, obj_player.spr_bigcollect2, obj_player.spr_bigcollect3, obj_player.spr_bigcollect4, obj_player.spr_bigcollect5, obj_player.spr_bigcollect6);
image_speed = 0.35;
gotowardsPlayer = false;
