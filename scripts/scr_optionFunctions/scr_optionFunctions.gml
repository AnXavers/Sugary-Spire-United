function draw_option()
{
	draw_set_color(c_white);
	if (argument3 == 0)
		draw_set_color(0x666666);
	draw_text(argument0, argument1, argument2);
	draw_set_color(c_white);
}
