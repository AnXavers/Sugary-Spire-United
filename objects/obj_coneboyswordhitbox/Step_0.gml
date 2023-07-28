x = obj_player.x;
y = obj_player.y;
image_xscale = obj_player.xscale;
with (obj_player)
{
	if (substate == 1 && state != 115 && state != 89)
		instance_destroy(other.id);
	if (substate == 2 && state != 116)
		instance_destroy(other.id);
}
