var dist = point_in_rectangle(obj_player.x, obj_player.y, x - 400, y - 400, x + 400, y);
if (dist && !solid_in_line(obj_player, [obj_solid]))
{
	if (sourbuddyspawn > 0)
		sourbuddyspawn--;
	else
	{
		with (instance_create(x, y, obj_sourbuddy))
		{
			var dir = sign(x - obj_player.x);
			var _x = point_distance(x, 0, obj_player.x, 0);
			var _offset = random_range(-1.5, 1.5);
			hsp = (_x / 400) * (8 * -dir);
			vsp = -8 + _offset;
		}
		sourbuddyspawn = irandom_range(30, 40);
	}
}
else
	sourbuddyspawn = 20;
