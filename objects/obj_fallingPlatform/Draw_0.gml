var _shakeX = (falling == 1 && fallbuffer > 0) ? random_range(-3, 3) : 0;
draw_sprite_ext(sprite_index, -1, x + _shakeX, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_sprite_ext(spr_movingplatformmiddle, -1, x + _shakeX, y, 1, 1, image_angle, image_blend, image_alpha);
