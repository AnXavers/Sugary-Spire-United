if (active == 1)
{
	draw_sprite_tiled_ext(bg_options, 0, bgTileX, bgTileY, 1, 1, c_white, 0.75);
	draw_set_font(global.smallfont);
	draw_set_halign(fa_right);
	var i = 0
	for (i = 0; i < (array_length(global.musiclist) - 1); i++)
		draw_jukebox(900, (270 - (selectedx * 60)) + (i * 60), string_replace(string_upper(global.musiclist[i]), "MU_", ""), selectedx, i);
	draw_set_halign(fa_left);
	var i = 0
	for (i = 0; i < (array_length(global.musiclist) - 1); i++)
		draw_jukebox(60, (270 - (selectedy * 60)) + (i * 60), string_replace(string_upper(global.musiclist[i]), "MU_", ""), selectedy, i);
}