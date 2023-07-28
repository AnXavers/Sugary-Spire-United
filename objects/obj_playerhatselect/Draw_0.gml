if (HatIndex[Selection] == 0)
{
	draw_sprite_ext(sprite_index, image_index, x + shake ? irandom_range(-2, 2) : 0, y + shake ? irandom_range(-2, 2) : 0, image_xscale, image_yscale, image_angle, 0x666666, image_alpha);
	draw_sprite_ext(spr_playerhatsMENU_lock, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
else
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
