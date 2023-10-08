if (active == 1)
{
	draw_sprite_tiled_ext(bg_options, 0, bgTileX, bgTileY, 1, 1, c_white, 0.75);
	draw_set_font(global.smallfont);
	draw_set_halign(fa_center);
	i = 0
	for (i = 0; i < (array_length(global.musiclist) - 1); i++)
		draw_jukebox(660 + (selectedx * 50) + (i * 50), 270, global.musiclist[i], selectedx);
	draw_set_font(global.font);
	draw_set_halign(fa_left);
	i = 0
	for (i = 0; i < (array_length(global.musiclist) - 1); i++)
		draw_jukebox(150, 270 + (selectedy * 50) + (i * 50), global.musiclist[i], selectedy);
}