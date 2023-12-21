if (room == rank_room || room == timesuproom)
	instance_destroy();
coneballspeed = 1;
sprite_index = obj_player.spr_coneball_player
if !coneballtype
{
	if (room == entryway_6b_new || room == steamy_7)
	{
		coneballspeed = 0.6;
		sprite_index = obj_player.spr_coneball_melting_player
	}
	else if (room == steamy_14)
	{
		coneballspeed = 0.8;
		sprite_index = obj_player.spr_coneball_melting_player
	}
}
if obj_player.state == (states.actor || states.comingoutdoor || states.victory || states.keyget)
{
	 coneballspeed = 0
}
with instance_create(x, y, obj_icontracker)
{
	target = other
	sprite_index = spr_icon_coneball
	image_speed = 0.35
}