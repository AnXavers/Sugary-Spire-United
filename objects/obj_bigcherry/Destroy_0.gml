if (ds_list_find_index(global.baddieroom, id) == -1)
{
	if (thrown)
	{
		with (instance_create(x, y, obj_bombexplosionconeboy))
			frog = true;
	}
	else if (place_meeting(x, y, obj_player))
	{
		with (instance_create(x, y, obj_gigacherrydead))
		{
			movespeed = abs(obj_player.frozenhsp) + 4;
			if (!global.hitstunEnabled)
				movespeed = abs(obj_player.hsp) + 4;
			image_xscale = obj_player.xscale;
		}
	}
	else if (place_meeting(x, y, obj_gigacherrydead))
	{
		var iceblock = instance_place(x, y, obj_gigacherrydead);
		with (instance_create(x, y, obj_gigacherrydead))
		{
			movespeed = abs(iceblock.hsp) + 4;
			image_xscale = iceblock.image_xscale;
		}
	}
	else
	{
		with (instance_create(x, y, obj_gigacherrydead))
		{
			movespeed = 8;
			image_xscale = -other.image_xscale;
		}
	}
}
event_inherited();
