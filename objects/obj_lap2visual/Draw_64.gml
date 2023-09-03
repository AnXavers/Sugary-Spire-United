var y_shk = irandom_range(-1, 1)
var x_shk = irandom_range(-1, 1)
draw_sprite(sprite_index, 0, x + x_shk, y + y_shk);
if global.inflapping != 0
{
	draw_set_font(global.lapcountfont)
	draw_set_halign(fa_left)
	draw_text(((x + 20) + x_shk), ((y - 52) + y_shk), string(global.lapcount))
}