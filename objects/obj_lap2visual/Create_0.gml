y = -sprite_height;
down = 1;
movespeed = 2;
lapvisualimg = 0;
depth = -100;
if global.inflapping != 1
{
	sprite_index = spr_lapvisual;
	if global.inflapping == 2
	{
		lapvisualimg = (global.lapcount - 2);
	}
}