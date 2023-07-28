image_angle += (hsp * 2);
x += hsp;
if (scr_solid(x + (1 * image_xscale), y))
{
	instance_create(x, y, obj_bumpeffect);
	instance_destroy();
}
