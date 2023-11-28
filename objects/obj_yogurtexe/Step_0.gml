if (obj_player.cutscene || global.freezeframe)
{
}
else
{
	image_index = 0
	if (aggro == 0)
	{
		if (point_distance(obj_player.x, obj_player.y, x, y) < 840)
		{
			x = median((x - movespd), obj_player.x, (x + movespd))
			y = median((y - movespd), obj_player.y, (y + movespd))
		}
		else
		{
			x = median((x - (movespd * 2)), obj_player.x, (x + (movespd * 2)))
			y = median((y - (movespd * 2)), obj_player.y, (y + (movespd * 2)))
		}
		if (global.fill_4 <= 0)
		{
			aggro = 1
			movespd = 8
		}
	}
	if (aggro == 1)
	{
		if (dist == -1)
			dist = point_distance(obj_player.x, obj_player.y, x, y)
		if (dist > 1500)
			dist = 1500
		var dir = point_direction(obj_player.x, obj_player.y, x, y)
		create_afterimage(7)
		x = (obj_player.x + lengthdir_x(dist, dir))
		y = (obj_player.y + lengthdir_y(dist, dir))
		if (movespd < 11)
			movespd += 0.3
		dist -= movespd
		if (dist < 0)
			dist = 0
	}
	if (aggro == 2)
	{
		if instance_exists(obj_coneball)
		{
			dir = point_direction(x, y, obj_coneball.x, obj_coneball.y)
			create_afterimage(7)
			x = approach(x, obj_coneball.x, lengthdir_x(movespd, dir))
			y = approach(y, obj_coneball.y, lengthdir_y(movespd, dir))
			obj_player.x = x
			obj_player.y = y
			with (obj_player)
			{
				state = (73 << 0)
				scr_player_hurt()
			}
			if (movespd < 14)
				movespd += 0.4
			else
				movespd = 16
		}
		else
		{
			aggro = 1
			movespd = 8
			x = round((room_width / 2))
			y = -40
			dist = point_distance(obj_player.x, obj_player.y, x, y)
		}
	}
	if (x > obj_player.x)
		image_xscale = -1
	if (x < obj_player.x)
		image_xscale = 1
	if (x > (obj_player.x - 32) && x < (obj_player.x + 32) )
		image_index = 1
}
y_timer++
if !instance_exists(obj_lowface)
	global.fill_4--
