if (flash)
	draw_sprite_ext_flash(sprite_index, image_index, x, y, xscale, image_yscale, 0, c_white, 1);
else
	draw_sprite_ext(sprite_index, image_index, x, y, xscale, image_yscale, 0, c_white, image_alpha);
draw_set_color(c_red);
draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
