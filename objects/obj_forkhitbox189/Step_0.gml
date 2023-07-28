if (!instance_exists(ID))
	instance_destroy();
if (instance_exists(ID))
{
	x = ID.x;
	y = ID.y;
	image_xscale = ID.image_xscale;
	image_index = ID.image_index;
	with (ID)
	{
		if (object_index == obj_sluggy)
		{
			if (obj_sluggy.state == 20 && obj_player.state != 93)
			{
				sluggyhitboxcreated = 0;
				instance_destroy(other.id);
			}
		}
	}
}
