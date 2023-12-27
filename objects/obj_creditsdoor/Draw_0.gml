if (DoorUnlock)
	draw_sprite_ext(spr_worlddoor, 1, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
else
	draw_sprite_ext(spr_worlddoor, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
