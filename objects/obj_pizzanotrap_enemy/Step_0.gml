if (!instance_exists(obj_pizzano_dance))
{
	visible = false;
	exit;
}
if (!important && enemyID != -4 && !instance_exists(enemyID) && ds_list_find_index(global.baddieroom, id) == -1)
	ds_list_add(global.baddieroom, id);
var not_in_list = ds_list_find_index(global.baddieroom, id) == -1;
switch (state)
{
	case 1:
		visible = false;
		image_speed = 0;
		image_index = 0;
		if (cooldown > 0)
			cooldown--;
		else if (!instance_exists(enemyID) && point_distance(x, 0, obj_player.x, 0) <= threshold_x && point_distance(0, y, 0, obj_player.y) <= threshold_y && (important || not_in_list))
		{
			state = 35;
			attack_buffer = 20;
		}
		break;
	case 35:
		visible = true;
		image_speed = 0.35;
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
