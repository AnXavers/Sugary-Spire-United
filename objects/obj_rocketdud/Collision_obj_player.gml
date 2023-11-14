if (collide == 1)
{
	instance_destroy(id, false);
	with (obj_player)
	{
		if (state != states.bottlerocket)
		{
			state = states.bottlerocket;
			xscale = other.image_xscale;
			x = other.x;
			y = other.y;
			image_index = 0;
			sprite_index = spr_bottlerocket;
		}
	}
}
