if global.panic
{
	sprite_index = spr_minipillarsleep;
	x = -900;
	y = -900;
	image_alpha = 0.5;
}
else
{
	sprite_index = spr_minipillarwoke;
	x = xstart;
	y = ystart;
	image_alpha = 1;
}