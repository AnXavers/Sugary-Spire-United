if instance_exists(obj_lapPortal)
{
	if (global.enableportal == 0 && cutscenestart == 0)
	{
		global.enableportal = 1
		sprite_index = spr_janitor2_summonIdle
	}
	else if sprite_index == spr_janitor2_summonPresent
	{
		instance_create(x, y, obj_lapjanitor)
		instance_destroy()
	}
	else if (obj_lapPortal.sprite_index = obj_player.spr_lapportal_idle && global.enableportal == 2)
	{
		sprite_index = spr_janitor2_summonPresent
		ds_list_add(global.saveroom, id);
	}
}