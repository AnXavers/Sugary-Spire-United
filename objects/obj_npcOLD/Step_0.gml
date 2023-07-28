self.step_event();
sin_x = 0;
sin_y = 0;
if (sin_add != 0)
{
	sin_set += sin_add;
	sin_move = sin(sin_set) * sin_mag;
	sin_x += lengthdir_x(sin_move, sin_dir);
	sin_y += lengthdir_y(sin_move, sin_dir);
}
draw_shakex = 0;
if (shake_magx > 0)
{
	shake_magx = approach(shake_magx, 0, shake_magx_acc);
	if (shake_timer > 0)
		shake_timer--;
	else
	{
		shake_dir *= -1;
		shake_timer = 3;
	}
	draw_shakex = shake_magx * shake_dir;
}
