y += 4;
if (scr_solid(x, y))
{
	instance_create(x, y, obj_bumpeffect);
	instance_destroy();
}
