draw_set_font(global.smallfont)
draw_set_halign(fa_left)
draw_text(20, 20, "PLACING " + string_upper(object_get_name(selected_obj)))
draw_sprite(spr_cursor, 0, cursor_x, cursor_y)