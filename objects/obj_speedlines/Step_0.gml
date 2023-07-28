x = playerID.x;
y = playerID.y;
image_xscale = playerID.xscale;
if (!(playerID.state == 69 && playerID.sprite_index != playerID.spr_mach1) && playerID.state != 70)
	instance_destroy();
