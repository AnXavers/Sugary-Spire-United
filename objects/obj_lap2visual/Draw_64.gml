var y_shk = irandom_range(-1, 1)
var x_shk = irandom_range(-1, 1)
draw_sprite(sprite_index, lapvisualimg, x + x_shk, y + y_shk);
if global.lapmode == 1
{
	draw_set_font(obj_player.font_lapcount)
	draw_set_halign(fa_left)
	draw_text(((x + 20) + x_shk), ((y - 52) + y_shk), string(global.lapcount))
}