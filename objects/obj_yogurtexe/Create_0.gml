movespd = 4.5
image_index = 0
image_speed = 0
x = round((room_width / 2))
y = -40
aggro = 0
dist = -1
if (global.fill_4 <= 0)
{
	aggro = 1
	movespd = 8
	dist = point_distance(obj_player.x, obj_player.y, x, y)
}
y_timer = 0