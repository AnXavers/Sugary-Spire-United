if (obj_player.state != 69 && obj_player.state != 70 && obj_player.state != 101)
{
	instance_destroy();
	if (instance_exists(obj_watertop))
		obj_watertop.created = 0;
	if (instance_exists(obj_minecartRail))
		obj_minecartRail.created = 0;
}
