if (pal_sprite != -4)
{
	pal_swap_set(pal_sprite, paletteselect, false);
	draw_sprite_ext(sprite_index, -1, drawx, drawy, image_xscale, image_yscale, image_angle, c_white, image_alpha);
	shader_reset();
}
else
	draw_sprite_ext(sprite_index, -1, drawx, drawy, image_xscale, image_yscale, image_angle, c_white, image_alpha);
