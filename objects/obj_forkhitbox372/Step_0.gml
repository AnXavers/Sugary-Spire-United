if (!instance_exists(ID) || (obj_player.state == 70 || obj_player.state == 121 || obj_player.state == 104 || obj_player.state == 101))
	instance_destroy();
if (instance_exists(ID))
{
	x = ID.x;
	y = ID.y;
	image_xscale = ID.image_xscale;
	image_index = ID.image_index;
	with (ID)
	{
		switch (object_index)
		{
			case obj_melon:
				if (state != 0 && state != 3)
				{
					hitboxcreate = 0;
					instance_destroy(other.id);
				}
				break;
			case obj_sluggy:
				if (state != 20)
				{
					hitboxcreate = 0;
					instance_destroy(other.id);
				}
				break;
			case obj_charger:
				if (state != 1 && sprite_index != spr_banana_charge)
				{
					hitboxcreate = 0;
					instance_destroy(other.id);
				}
				break;
			case obj_swedishfish:
				if (state != 5)
				{
					hitboxcreate = 0;
					instance_destroy(other.id);
				}
				break;
		}
	}
}
