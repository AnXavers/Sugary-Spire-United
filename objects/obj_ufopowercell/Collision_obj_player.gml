if (canbecollected == 1)
{
	if (obj_player.state == states.ufodashOLD)
	{
		obj_player.ufotimer += 4;
		obj_player.ufomaxspeed++;
		canbecollected = false;
		image_alpha = 0.5;
	}
}
