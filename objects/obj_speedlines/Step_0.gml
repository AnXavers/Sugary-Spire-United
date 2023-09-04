x = obj_player.x;
y = obj_player.y;
image_xscale = obj_player.xscale;
if (!(obj_player.state == 69 && obj_player.sprite_index != obj_player.spr_mach1) && obj_player.state != 70)
	instance_destroy();
