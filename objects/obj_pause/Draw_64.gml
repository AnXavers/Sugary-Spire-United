if (global.gamePauseState == 1 && !instance_exists(obj_pausefadeout))
{
	draw_sprite_tiled(bg_pausescreenTile, 0, bgTileX, bgTileY);
	draw_rectangle_color(-5000, 0, 0, 1080, 2752517, 2752517, 2752517, 2752517, false);
	draw_rectangle_color(960, 0, 5960, 1080, 2752517, 2752517, 2752517, 2752517, false);
	draw_sprite(spr_pause, selected, 0, 0);
	draw_sprite(spr_pauseconfecti1, global.mallowfollow, 0, 0);
	draw_sprite(spr_pauseconfecti2, global.chocofollow, 0, 0);
	draw_sprite(spr_pauseconfecti3, global.crackfollow, 0, 0);
	draw_sprite(spr_pauseconfecti4, global.wormfollow, 0, 0);
	draw_sprite(spr_pauseconfecti5, global.candyfollow, 0, 0);
	if (playerCustomPalette)
		pal_swap_set(playerSPalette, 1, true);
	else
		pal_swap_set(playerSPalette, playerPalSelect, 0);
	draw_sprite(playerPauseSprite, global.panic, 686, 285);
	shader_reset();
	draw_set_font(global.font);
	draw_set_halign(1);
	draw_set_color(c_white);
	var _x = 86;
	var _y = 32;
	if (global.playseconds > 10)
		draw_text(_x, _y, string_hash_to_newline(string(global.playminutes) + ":" + string(global.playseconds)));
	if (global.playseconds < 10)
		draw_text(_x, _y, string_hash_to_newline(string(global.playminutes) + ":0" + string(global.playseconds)));
}
