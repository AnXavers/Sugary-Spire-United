if (global.coneblock == 1 && delay == 0 && sprite_index != spr_coneswitch_ON)
	sprite_index = spr_coneswitch_ON;
else if (global.coneblock == 0 && delay == 0 && sprite_index != spr_coneswitch_OFF)
	sprite_index = spr_coneswitch_OFF;
