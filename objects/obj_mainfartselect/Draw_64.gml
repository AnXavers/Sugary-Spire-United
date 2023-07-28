draw_set_font(global.promptfont);
draw_set_halign(1);
draw_set_color(c_white);
draw_text(xi, yi, string_hash_to_newline(_message));
