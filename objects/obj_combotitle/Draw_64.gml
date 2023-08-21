if (title != 0)
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, alpha);
	if global.dotruly
		draw_sprite_ext(spr_combotruly, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, alpha)