draw_self()
if fieldsize != 0
{
	draw_set_alpha(0.2)
	draw_set_color(c_green)
	var _depth = depth
	depth = -100
	draw_circle(x + random_range(-1, 1), y + random_range(-1, 1), (fieldsize + 6), false)
	draw_set_color(c_white)
	draw_circle(x + random_range(-1, 1), y + random_range(-1, 1), fieldsize, false)
	depth = _depth
	draw_set_alpha(1)
}