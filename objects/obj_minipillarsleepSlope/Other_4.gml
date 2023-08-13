if (global.panic == 0)
{
	sprite_index = spr_minipillarsleepSlope;
	x = -900;
	y = -900;
	image_speed = 0.35;
}
else if (global.switchactivated == 1 || global.panic == 1)
{
	sprite_index = spr_minipillarwokeSlope;
	x = xstart;
	y = ystart;
	image_speed = 0.35;
}
