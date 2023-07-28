if (obj_player.state == 17)
{
	if (obj_player.xscale == -1)
		obj_player.movespeed = -obj_player.movespeed;
	obj_player.ridingmarsh = true;
	obj_player.state = 83;
	instance_destroy();
}
