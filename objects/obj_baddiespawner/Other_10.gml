if (object_exists(content))
{
	with (instance_create(x, y - 20, content))
	{
		other.baddieid = id;
		image_xscale = sign(other.image_xscale);
		state = 6;
		squashedx = true;
		squashvalx = 0;
		stunned = 50;
		vsp = -5;
		important = true;
	}
}
refresh = 100;
