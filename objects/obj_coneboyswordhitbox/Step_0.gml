x = obj_player.x;
y = obj_player.y;
image_xscale = obj_player.xscale;
with (obj_player)
{
	if (substate == 1 && state != states.coneboy_inhale115 && state != states.uppercut)
		instance_destroy(other.id);
	if (substate == 2 && state != states.coneboy_kick)
		instance_destroy(other.id);
}
