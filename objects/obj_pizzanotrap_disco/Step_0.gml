if (!instance_exists(obj_pizzano_dance))
	exit;
switch (state)
{
	case 1:
		y = approach(y, ystart, 6);
		if (cooldown > 0)
			cooldown--;
		else if (point_distance(x, 0, obj_player.x, 0) <= threshold_x && point_distance(0, y, 0, obj_player.y) <= threshold_y && y == ystart)
		{
			state = 35;
			attack_buffer = 5;
		}
		break;
	case 74:
		hsp = 0;
		vsp = 10;
		scr_collide();
		if (grounded && vsp > 0)
			state = 1;
		break;
	case 35:
		if (attack_buffer > 0)
			attack_buffer--;
		else
		{
			with (obj_pizzano_dance)
			{
				if (state != 35)
				{
					trap_x = other.x;
					trap_y = other.y;
					event_perform(2, 0);
					other.state = 1;
					other.cooldown = other.cooldown_max;
				}
			}
		}
		break;
}
