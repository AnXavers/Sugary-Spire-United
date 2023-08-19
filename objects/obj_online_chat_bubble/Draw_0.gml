if (global.oldsmallfont_chat >= 1 || text != string_upper(text))
    font = global.old_smallfont
else
    font = global.smallfont
draw_set_font(font)
draw_set_halign(xorigin)
draw_set_valign(yorigin)
draw_text_color(x, y, text, textcolor, textcolor, textcolor, textcolor, alpha)
