function get_dark()
{
	var b = 1;
	with (instance_nearest(x, y, obj_lightsource))
	{
		var dis = distance_to_object(other);
		var col = collision_line(x, y, other.x, other.y, obj_solid, false, true);
	}
	b = clamp(b, 0, 1);
	return b;
}
