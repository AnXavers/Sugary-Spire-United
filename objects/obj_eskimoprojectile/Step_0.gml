x += (image_xscale * 6);
if (scr_solid(x + (1 * image_xscale), y) && bumpcount < 1)
{
	image_xscale *= -1;
	bumpcount++;
}
if (scr_solid(x + (1 * image_xscale), y) && bumpcount >= 1)
{
	instance_create(x, y, obj_bumpeffect);
	instance_destroy();
}
