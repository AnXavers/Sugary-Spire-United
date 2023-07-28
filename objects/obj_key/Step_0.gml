if (vsp < 12)
	vsp += grav;
if (inv_frame == 1)
	image_alpha = 0.5;
if (inv_frame == 0)
	image_alpha = 1;
scr_collide();
if (scr_solid(x, y, false))
{
	var dir = point_direction(x, y, obj_player.x, obj_player.y);
	x += lengthdir_x(16, dir);
	y += lengthdir_y(16, dir);
}
