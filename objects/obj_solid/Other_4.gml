if !object_get_parent(obj_solid)
{
	sprite_index = spr_wall
	if global.solidfellow
	{
		sprite_index = spr_wallfellow
		image_xscale = (image_xscale / 2)
		image_yscale = (image_yscale / 2)
	}
}