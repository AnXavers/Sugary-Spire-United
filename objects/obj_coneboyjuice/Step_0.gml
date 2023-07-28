scr_collide_conehead();
hsp = image_xscale * movespeed;
if (grounded)
{
	vsp *= -0.85;
	y--;
	bounce++;
}
draw_angle = point_direction(x, y, x + hsp, y + vsp);
if ((scr_solid(x + image_xscale, y, true) && !grounded) || bounce >= 3)
	instance_destroy();
