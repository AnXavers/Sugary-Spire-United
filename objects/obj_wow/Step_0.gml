if (place_meeting(x, y, obj_player) && global.panic == 1)
{
	instance_destroy();
	instance_create(x, y, obj_rudejanitor);
	global.lapmusic = true;
	ds_list_clear(global.baddieroom);
	obj_rudejanitor.visible = true;
}
if (global.janitortype == 1)
	sprite_index = spr_rudejanitor_unlock;
else
	sprite_index = spr_janitor2_unlock;
image_speed = 0.35;
