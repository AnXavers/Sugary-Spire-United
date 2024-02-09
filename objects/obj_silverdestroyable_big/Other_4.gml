if array_contains(global.fragments, fragmentid)
{
	with instance_create(x, y, obj_solid)
	{
		image_xscale = other.image_xscale * 2
		image_yscale = other.image_yscale * 2
	}
	instance_destroy();
	exit;
}
event_inherited();