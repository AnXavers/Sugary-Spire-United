if (place_meeting(x, y - 4, obj_player) && activated == 0)
{
	activated = 1;
	sprite_index = spr_whipcreamcanopen;
	instance_create(x + 222, y, obj_whipcreamcap);
	with (instance_create(x + offset, y, obj_whipcreamplatform))
		image_xscale = instance_nearest(x, y, obj_whipcreamcan).whipcreamxscale;
}
if (activated == 0)
	sprite_index = spr_whipcreamcan;
if (place_meeting(x, y - 4, obj_player) && obj_player.state == states.backbreaker)
	activated = 0;
