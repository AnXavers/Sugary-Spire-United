function pal_swap_draw_palette()
{
	draw_sprite_part(argument0, 0, floor(argument1), 0, 1, sprite_get_height(argument0), argument2, argument3);
}
function pal_swap_get_color_count()
{
	return sprite_get_height(argument0);
}
function pal_swap_get_pal_count()
{
	return sprite_get_width(argument0);
}
