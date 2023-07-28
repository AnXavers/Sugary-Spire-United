var _border = 192;
draw_set_color(c_black);
draw_rectangle(-_border, -_border, room_width, 0, false);
draw_rectangle(-_border, room_height, room_width, room_height + _border, false);
draw_rectangle(-_border, -_border, 0, room_height + _border, false);
draw_rectangle(room_width, -_border, room_width + _border, room_height + _border, false);
draw_set_color(c_white);
