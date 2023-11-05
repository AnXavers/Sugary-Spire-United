if (!instance_exists(ID) || (obj_player.state == states.mach3 || obj_player.state == 121 || obj_player.state == 104 || obj_player.state == 101))
	instance_destroy();
if (instance_exists(ID))
{
	x = ID.x;
	y = ID.y;
	image_xscale = ID.image_xscale;
	image_index = ID.image_index;
}
