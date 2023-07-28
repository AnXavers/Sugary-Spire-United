scr_collide();
if (scr_solid(x + hsp, y + vsp, false))
{
	instance_create(x, y, obj_explosioneffect);
	instance_destroy();
}
