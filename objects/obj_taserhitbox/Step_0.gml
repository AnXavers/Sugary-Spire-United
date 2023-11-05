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
		if (object_index == obj_officerwhoopiepie)
		{
			if (state != 0 && state != 3)
			{
				hitboxcreate = 0;
				instance_destroy(other.id);
			}
		}
		if (obj_player.state == states.mach3)
		{
			hitboxcreate = 0;
			instance_destroy(other.id);
		}
	}
}
