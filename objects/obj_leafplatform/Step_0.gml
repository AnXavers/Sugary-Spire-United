if (!instance_exists(obj_plant))
{
	with (instance_create(x, y, obj_platform))
		image_xscale = instance_nearest(x, y, obj_leafplatform).image_xscale;
	instance_destroy();
}
