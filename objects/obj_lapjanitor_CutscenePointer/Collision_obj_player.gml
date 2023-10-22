if (cutscenestart && instance_exists(obj_lapjanitor) && global.panic)
{
	global.combofreeze = 30;
	instance_destroy(obj_lapjanitor)
	visible = true
	sprite_index = spr_janitor2_summonIntro
	cutscenestart = 0
}