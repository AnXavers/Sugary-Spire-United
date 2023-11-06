x = obj_player.x;
y = obj_player.y;
image_xscale = obj_player.xscale;
if (!(obj_player.state == states.mach2 && obj_player.sprite_index != obj_player.spr_mach1) && obj_player.state != states.mach3)
	instance_destroy();
