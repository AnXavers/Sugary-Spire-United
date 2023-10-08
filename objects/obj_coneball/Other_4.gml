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
else
{
}