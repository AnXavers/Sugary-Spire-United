if (global.gamePauseState == 1 && !instance_exists(obj_pausefadeout))
{
	draw_sprite_tiled(bg_pausescreenTile, 0, bgTileX, bgTileY);
	draw_rectangle_color(-5000, 0, 0, 1080, 2752517, 2752517, 2752517, 2752517, false);
	draw_rectangle_color(960, 0, 5960, 1080, 2752517, 2752517, 2752517, 2752517, false);
	draw_sprite(spr_pause, selected, 0, 0);
	if global.levelname != "none"
	{
		draw_sprite(spr_pauseconfecti1, global.mallowfollow, 0, 0);
		draw_sprite(spr_pauseconfecti2, global.chocofollow, 0, 0);
		draw_sprite(spr_pauseconfecti3, global.crackfollow, 0, 0);
		draw_sprite(spr_pauseconfecti4, global.wormfollow, 0, 0);
		draw_sprite(spr_pauseconfecti5, global.candyfollow, 0, 0);
		var _secretspr = global.secretfound >= 3 ? spr_secretPortalPause : spr_secretPortalPauseBlack;
		draw_sprite(_secretspr, floor(frameref), 910, 490);
		draw_set_halign(fa_center)
		draw_set_valign(fa_center)
		draw_set_font(global.promptfont)
		var _y_wave = wave(-3, 3, 4, 0)
		var _y_wave2 = wave(-4, 4, 5, 0, current_time + 600)
		var _x_wave = wave(-4, 4, 5, 0,)
		var _x_wave2 = wave(-4, 4, 5, 0, current_time + 600)
		draw_text(910, 480 + _y_wave, string(global.secretfound))
		var _treasuresprname = string_split(sprite_get_name(treasurespr), "_")
		var _treasurepausespr = _treasuresprname[0] + "_" + _treasuresprname[1] + "_pause_" + _treasuresprname[2]
		draw_sprite(asset_get_index(_treasurepausespr), 0, 920, 405 + _y_wave2)
		draw_sprite_ext(treasurespr, 0, 920, 405 + _y_wave2, 1, 1, 0, (global.treasure * c_white), 1)
		draw_set_font(global.smalllapfont)
		var _lapspr = global.lapcount >= 2 ? spr_lappingportal_HUD_pause2 : spr_lappingportal_HUD_pause;
		draw_sprite_ext(_lapspr, frameref, 825 + _x_wave, 500, 1, 1, 90, c_white, 1)
		if _lapspr != spr_lappingportal_HUD_pause
			draw_text(785 + _x_wave2, 500, string(global.lapcount))
		draw_set_valign(0)
	}
	if (playerCustomPalette)
		pal_swap_set(playerSPalette, 1, true);
	else
		pal_swap_set(playerSPalette, playerPalSelect, 0);
	draw_sprite(playerPauseSprite, global.panic, 686, 285);
	shader_reset();
	draw_set_font(global.font);
	draw_set_halign(fa_center);
	draw_set_color(c_white);
	var _x = 86;
	var _y = 32;
	if (global.playseconds > 10)
		draw_text(_x, _y, string_hash_to_newline(string(global.playminutes) + ":" + string(global.playseconds)));
	if (global.playseconds < 10)
		draw_text(_x, _y, string_hash_to_newline(string(global.playminutes) + ":0" + string(global.playseconds)));
}
