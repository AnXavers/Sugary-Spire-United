if (canbecollected == 0)
	image_alpha = 0.5;
if (canbecollected == 1)
	image_alpha = 1;
if (obj_player.state != 144 && obj_player.state != 145 && obj_player.state != 146)
	canbecollected = true;
