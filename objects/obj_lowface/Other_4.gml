if (room == rank_room || room == timesuproom)
	instance_destroy();
if obj_player.state == (states.actor || states.comingoutdoor || states.victory || states.keyget)
{
	vspeed = 0
	hspeed = 0
}