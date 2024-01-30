function scr_enemy_inhaled()
{
	boundbox = 0;
	var angle = point_direction(x, y, obj_player.x, obj_player.y - 25);
	var len = 7
	len += 0.1
	hsp = lengthdir_x(len, angle);
	vsp = lengthdir_y(len, angle);
	sprite_index = grabbedspr;
	grav = 0;
	if (obj_player.state != states.coneboy_inhale115)
	{
		state = 6;
		grav = 0.35;
		boundbox = 1;
	}
	inhaleddestroyvar = true;
}
