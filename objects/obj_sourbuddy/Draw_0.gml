pal_swap_set(spr_sbpalette, palcolor, 0);
var _shake = random_range(-shakemag, shakemag);
draw_sprite_ext(sprite_index, image_index, x + _shake, y + _shake, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
pal_swap_reset();
