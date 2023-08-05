draw_sprite(sprite_index, 0, x + irandom_range(-1, 1), y + irandom_range(-1, 1));
draw_set_font(global.lapcountfont)
draw_set_halign(fa_left)
draw_text(((x + 20) + irandom_range(-1, 1)), ((y - 52) + irandom_range(-1, 1)), string(global.lapcount))