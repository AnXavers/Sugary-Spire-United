if (place_meeting(x, y - 1, obj_iceblock))
{
	with (instance_place(x, y - 1, obj_iceblock))
	{
		if (other.heavy)
			other.activated = (type == "Heavy") ? true : false;
		else
			other.activated = true;
	}
}
else if (obj_player && place_meeting(x, y - 1, obj_player))
	activated = true;
else if (weighted)
	activated = false;
image_index = activated;
