if global.panic
{
	sprite_index = spr_minipillarsleep_slope;
	x = -900;
	y = -900;
	image_alpha = 0.5;
}
else
{
	sprite_index = spr_minipillarwoke_slope;
	x = xstart;
	y = ystart;
	image_alpha = 1;
}