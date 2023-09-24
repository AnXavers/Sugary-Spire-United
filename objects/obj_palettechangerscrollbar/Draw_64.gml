draw_sprite_ext(spr_palettechanger_scrollbar, selected, draw_x, draw_y, 1, 1, 0, c_white, 1)
var top_x = (draw_x - sprite_get_xoffset(spr_palettechanger_scrollbar))
var top_y = (draw_y - sprite_get_yoffset(spr_palettechanger_scrollbar))
var bottom_x = (draw_x + sprite_get_xoffset(spr_palettechanger_scrollbar))
var bottom_y = (draw_y + sprite_get_yoffset(spr_palettechanger_scrollbar))
draw_rectangle_color((top_x + 4), (top_y + 4), (bottom_x - 5), (bottom_y - 5), c_black, draw_color, draw_color, c_black, 0)
draw_sprite_ext(spr_palettechanger_scrollbarbutton, -1, button_x, draw_y, 1, 1, 0, c_white, 1)
draw_sprite_ext(spr_palettechanger_textbox, input_text, ((bottom_x + 8) + sprite_get_xoffset(spr_palettechanger_textbox)), draw_y, 1, 1, 0, c_white, 1)
draw_set_font(global.smallfont)
draw_set_halign(fa_center)
if (input_text == 1)
{
	var length = ((-((string_width(string(input)) / 2))) + string_width(string(input)))
	draw_text(((bottom_x + 8) + sprite_get_xoffset(spr_palettechanger_textbox)), (draw_y - 5), string(input))
	draw_text(((((bottom_x + 8) + sprite_get_xoffset(spr_palettechanger_textbox)) + length) + 5), (draw_y - 5), cursor)
}
else
	draw_text(((bottom_x + 8) + sprite_get_xoffset(spr_palettechanger_textbox)), (draw_y - 5), string(round((colorvalue * 255))))
