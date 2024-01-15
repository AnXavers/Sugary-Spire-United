function scr_layerswap()
{
	if (global.panic == 1)
	{
		layer_change_background(bg_waferback1, bgwafer_escape2)
		layer_change_background(bg_waferback2, bgwafer_escape1)
		layer_change_background(bg_waferclouds, bgwafer_escape3)
		layer_change_background(bg_wafersun, bgwafer_escape4)
		layer_change_background(bg_wafersky, bgwafer_escape5)
		layer_change_background(bg_waferback1_new, bgwafer_escape2_new)
		layer_change_background(bg_waferback2_new, bgwafer_escape1_new)
		layer_change_background(bg_waferclouds_new, bgwafer_escape3_new)
		layer_change_background(bg_wafersun_new, bgwafer_escape4_new)
		layer_change_background(bg_wafersky_new, bgwafer_escape5_new)
		layer_change_background(bg_entryway2_sky, bg_entrywaynightsky)
		layer_change_background(bg_entryway2_clouds, bg_entrywayescapeclouds)
		layer_change_background(bg_entryway2_buildings, bg_escapebuildingsentryway)
		layer_change_background(bg_entryway2_buildings2, bg_escapebuildingsentryway2)
		layer_change_background(bg_entryway2_sun, bg_entrywayescapemoon)
		layer_change_background(entryway_endroombg1, entryway_endroomescape1)
		layer_change_background(entryway_endroombg2, entryway_endroomescape2)
		layer_change_background(entryway_endroombg3, entryway_endroomescape3)
		layer_change_background(entryway_endroombg4, entryway_endroomescape4)
		layer_change_background(entryway_endroombg5, entryway_endroomescape5)
		layer_change_background(back, sky_esc_back)
		layer_change_background(cottonskynull, sky_esc_back2)
		layer_change_background(steamybg1, sky_esc_back)
		layer_change_background(clock, sky_esc_screaming_front_cakes)
		layer_change_background(ship, sky_esc_screaming_ships)
		layer_change_background(steamybg5, sky_esc_screaming_smiling_cakes)
		layer_change_background(steamybg4, steamybg4_escape)
		layer_change_background(steamybg3, steamybg3_escape)
		layer_change_background(bgsky2main2, sky_esc_screaming_cakes)
		layer_change_background(cl1, sky_esc_screaming_clouds)
		layer_change_background(cl2, sky_esc_screaming_clouds)
		layer_change_background(bg_steamypark, bg_steamyparkescape)
		layer_change_background(bg_clock1, bg_clock1_escape)
		layer_change_background(bg_clockparallax1, bg_clockparallaxescape)
		layer_change_background(spr_clockparallax2, spr_clockparallax2_escape)
		layer_change_background(bg_clockend_1, bg_clockend_1escape)
		layer_change_background(bg_clockend_2, bg_clockend_2escape)
		layer_change_background(bg_clockend_3, bg_clockend_3escape)
		layer_change_background(spr_molassesbgpara1, spr_molassesbgpara1_escape)
		layer_change_background(spr_molassesbgpara2, spr_molassesbgpara2_escape)
		layer_change_background(spr_molassesbgpara3, spr_molassesbgpara3_escape)
		layer_change_background(spr_molassesbgpara5, spr_molassesbgpara5_escape)
		layer_change_background(bg_temple2_1, bg_temple2_1Escape)
		layer_change_background(bg_temple2_2, bg_temple2_2Escape)
		layer_change_background(bg_temple2_3, bg_temple2_3Escape)
		layer_change_background(bg_temple2_4, bg_temple2_4Escape)
		layer_change_background(bg_molassesfall, bg_molassesfallEscape)
		layer_change_background(bg_templebgnew1, bg_templebgnew1Escape)
		layer_change_background(bg_templebgnew2, bg_templebgnew2Escape)
		layer_change_background(bg_templebgnew3, bg_templebgnew3Escape)
		layer_change_background(bg_mines1, bg_mines1_escape)
		layer_change_background(bg_mines1para1, bg_mines1para1_escape)
		layer_change_background(bg_mines1para2, bg_mines1para2_escape)
		layer_change_background(bg_mines2, bg_mines2_escape)
		layer_change_background(bg_mines2_hills, bg_mines2_hills_escape)
		layer_change_background(bg_mines3, bg_mines3_escape)
		layer_change_tileset(ts_mountain1_night, ts_mountain1_day)
		layer_change_background(bg_fudgetop_foreground, spr_backgroundnull)
		layer_change_background(bg_fudgetop_foreground2, spr_backgroundnull)
		layer_change_background(bg_fudgetop_frontmountain, bg_futopmelt1)
		layer_change_background(bg_fudgetop_mountainback, spr_backgroundnull)
		layer_change_background(bg_fudgetop_sky, bg_futopmelt2)
		layer_change_background(bg_fudgetop_skyscroll, spr_backgroundnull)
		layer_change_background(bg_fudgetop2_foreground, bg_fudgetop2_foreground_escape)
		layer_change_background(bg_fudgetop2_1, bg_fudgetop2_1_escape)
		layer_change_background(bg_fudgetop2_2, bg_fudgetop2_2_escape)
		layer_change_background(bg_fudgetop2_3, bg_fudgetop2_3_escape)
		layer_change_background(bg_fudgetop2_4, bg_fudgetop2_4_escape)
		layer_change_background(bg_fudgetop3_1, bg_fudgetop3_1escape)
		layer_change_background(bg_fudgetop3_2, bg_fudgetop3_2escape)
		layer_change_background(bg_fudgetop3_flyingDude, bg_fudgetop3_flyingDudeescape)
		layer_change_background(bg_fudgetop3_3, bg_fudgetop3_3escape)
		layer_change_background(bg_fudgetop3_4, bg_fudgetop3_4escape)
		layer_change_background(bg_fudgetop3_5, bg_fudgetop3_5escape)
		layer_change_background(bg_fudgetop3_skyscroll2, bg_fudgetop3_skyscroll2escape)
		layer_change_background(bg_sucrose_skySleep, bg_sucrose_skyActive)
		layer_change_background(bg_sucrosebgDebrisSleep, bg_sucrosebgDebris)
		layer_change_background(bg_sucrose_skyWakingUp, bg_sucrose_skyActive)
		layer_change_background(bg_estate1back1, bg_estate1back1E)
		layer_change_background(bg_estate1back2, bg_estate1back2E)
		layer_change_background(bg_estate1clouds, bg_estate1cloudsE)
		layer_change_background(bg_estate1ground1, bg_estate1ground1E)
		layer_change_background(bg_estate1ground2, bg_estate1ground2E)
		layer_change_background(bg_estate1sky, bg_estate1skyE)
		layer_change_background(bg_estate1sun, bg_estate1sunE)
		layer_change_background(bg_lab, bg_labEscape)
		layer_change_background(bg_labpipes, bg_labpipesEscape)
		layer_change_background(bg_exitwaysky, bg_exitwayskyE)
		layer_change_background(bg_exitwaylighthousebottom, bg_exitwaylighthousebottomE)
		layer_change_background(bg_exitwaylighthouse, bg_exitwaylighthouseE)
		layer_change_background(bg_exitwaygraffitiwall, bg_exitwaygraffitiwallE)
		layer_change_background(bg_exitwayclouds2, bg_exitwayclouds2E)
		layer_change_background(bg_exitwayclouds1, bg_exitwayclouds1E)
		layer_change_background(bg_exitwaycityback, bg_exitwaycitybackE)
		layer_change_background(bg_exitwaycity, bg_exitwaycityE)
		layer_change_background(bg_stormy, bg_stormy1_esc)
		layer_change_background(bg_stormy_rain, bg_stormy_rain_esc)
		layer_change_background(bg_hub3_clouds, bg_hub3_clouds_esc)
	}
	var _ext = ""
	switch global.leveldesign
	{
		case 1:
			_ext = "_new"
			break;
		case 2:
			_ext = "_old"
			break;
		case 3:
			_ext = "_custom"
			break;
	}
	if _ext != ""
	{
		var a = layer_get_all();
		for (var i = 0; i < array_length(a); i++)
		{
			var back_id = layer_background_get_id_fixed(a[i]);
			var back_swap = asset_get_index(sprite_get_name(layer_background_get_sprite(back_id)) + _ext)
			if (back_swap != -1)
				layer_background_sprite(back_id, asset_get_index(sprite_get_name(layer_background_get_sprite(back_id)) + _ext));
			var tile_id = layer_tilemap_get_id_fixed(a[i]);
			var tile_swap = asset_get_index(tileset_get_name(tilemap_get_tileset(tile_id)) + _ext)
			if (tile_swap != -1)
				tilemap_tileset(tile_id, tile_swap);
		}
	}
}