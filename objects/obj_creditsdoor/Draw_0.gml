if (DoorUnlock)
	draw_sprite_ext(spr_worlddoor_open, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
else
	draw_sprite_ext(spr_worlddoor_closed, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
