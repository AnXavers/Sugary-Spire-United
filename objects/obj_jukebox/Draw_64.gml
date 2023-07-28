var select = music[selected];
var song = select[0];
var name = select[1];
var author = select[2];
if (active == 1)
{
	draw_set_font(global.creditsfont);
	draw_set_halign(1);
	draw_set_color(c_white);
	draw_text(480, 200, name);
	draw_text(480, 250, author);
}
