image_xscale = playerID.xscale;
if (playerID.state != 70 && playerID.state != 101)
	instance_destroy();
if (playerID.state != 101)
	x = playerID.x + (16 * playerID.xscale);
else if (playerID.state == 101)
	x = playerID.x + (32 * playerID.xscale);
y = playerID.y;
depth = playerID.depth - 6;
if (playerID.state == 31 || playerID.sprite_index == playerID.spr_dive || (playerID.state == 101 && playerID.movespeed < 12))
	instance_destroy();
