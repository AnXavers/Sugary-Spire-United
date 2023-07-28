if (global.panic == 0)
{
	sprite_index = spr_minipillarsleep;
	x = -900;
	y = -900;
}
else if (global.switchactivated == 1 || global.panic == 1)
{
	sprite_index = spr_minipillarwoke;
	x = xstart;
	y = ystart;
}
