function scr_enemy_inhaled()
{
	boundbox = 0;
	var angle = point_direction(x, y, obj_player.x, obj_player.y - 25);
	x += lengthdir_x(3, angle);
	y += lengthdir_y(3, angle);
	sprite_index = grabbedspr;
	grav = 0;
	if (obj_player.state != 115)
	{
		state = 6;
		grav = 0.35;
		boundbox = 1;
	}
	inhaleddestroyvar = true;
}
