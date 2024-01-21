function draw_option(_x, _y, _string, _optionvar)
{
	draw_set_color(c_white);
	if (_optionvar == 0)
		draw_set_color(0x666666);
	draw_text(_x, _y, _string);
	draw_set_color(c_white);
}
function draw_jukebox(argument0, argument1, argument2, argument3, argument4)
{
	draw_set_color(c_white);
	if (argument3 == argument4)
		draw_set_color(0x666666);
	draw_text(argument0, argument1, argument2);
	draw_set_color(c_white);
}
