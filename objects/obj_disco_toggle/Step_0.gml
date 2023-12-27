if (place_meeting(x, y, obj_player))
	global.dancetimer = timer;
if (global.dancetimer > 0 && (sprite_index != spr_onoffblock_canny && sprite_index != spr_onoffblock_cannyswitch))
{
	sprite_index = spr_onoffblock_cannyswitch;
	scr_sound(sound_coneswitch1)
}
if (global.dancetimer <= 0 && (sprite_index != spr_onoffblock_uncanny && sprite_index != spr_onoffblock_uncannyswitch))
{
	sprite_index = spr_onoffblock_uncannyswitch;
	scr_sound(sound_coneswitch2)
}