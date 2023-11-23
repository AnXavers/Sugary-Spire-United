flags.do_save = false;
flags.do_once = false;
condition = function()
{
	return place_meeting(x, y, obj_player);
};
output = function()
{
	audio_stop_all_music()
	instance_destroy(obj_solid)
	instance_destroy(obj_slope)
	instance_destroy(obj_platform)
	instance_destroy(obj_collect)
	instance_destroy(obj_ladder)
	instance_destroy(obj_destroyable2)
	instance_destroy(obj_destroyable)
	instance_destroy(obj_slopePlatform)
	instance_destroy(obj_minipillarsleep)
	instance_destroy(obj_minipillarwoke)
	instance_destroy(obj_eventtrigger)
	instance_destroy(obj_gumslime)
};
