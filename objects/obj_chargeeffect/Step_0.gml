image_xscale = obj_player.xscale;
if (obj_player.state != states.mach3 && obj_player.state != 101)
	instance_destroy();
if (obj_player.state != 101)
	x = obj_player.x + (16 * obj_player.xscale);
else if (obj_player.state == 101)
	x = obj_player.x + (32 * obj_player.xscale);
y = obj_player.y;
depth = obj_player.depth - 6;
if (obj_player.state == 31 || obj_player.sprite_index == obj_player.spr_dive || (obj_player.state == 101 && obj_player.movespeed < 12))
	instance_destroy();
