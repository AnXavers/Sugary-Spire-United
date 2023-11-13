if (canbecollected == 0)
	image_alpha = 0.5;
if (canbecollected == 1)
	image_alpha = 1;
if (obj_player.state != states.seacream && obj_player.state != states.seacreamjump && obj_player.state != states.seacreamstick)
	canbecollected = true;
