if (place_meeting(x, y, obj_player))
	global.dancetimer = timer;
if (global.dancetimer > 0)
	sprite_index = spr_onoffblock_canny;
if (global.dancetimer <= 0)
	sprite_index = spr_onoffblock_uncanny;
