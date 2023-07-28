if (canbecollected == 1)
{
	if (obj_player.state == 124)
	{
		obj_player.ufotimer += 4;
		obj_player.ufomaxspeed += 1;
		canbecollected = false;
		image_alpha = 0.5;
	}
}
