if (state != 1)
	draw_sprite(spr_static_tech, staticdex, 0, 0);
else
{
	draw_sprite(spr_technicaldifficulty, 0, 0, 0);
	scr_palette_as_player();
	draw_sprite(spr_technicaldifficulty_pizzy, 0, 797, 328);
	pal_swap_reset();
}
