draw_set_color(c_black);
draw_set_alpha(fadealpha);
draw_rectangle(0, 0, room_width, room_height, false);
draw_set_alpha(1);
draw_set_color(c_white);
if (shown)
{
	draw_sprite(info.bginfo[0], 0, bgX, bgY);
	scr_palette_as_player();
	draw_sprite(info.bginfo[0], 1, bgX, bgY);
	if (obj_player.character != "P")
		draw_sprite(spr_card_featuringme, obj_player.img_featuringme, featuringX, featuringY)
	pal_swap_reset();
	draw_sprite(info.titleinfo[0], 0, titleX, titleY);
}
