with obj_editor_decoy
{
	with instance_create(x, y, obj)
	{
		image_xscale = other.image_xscale
		image_yscale = other.image_yscale
		image_angle = other.image_angle
		editor = true
	}
	instance_destroy();
}
with obj_player
{
	state = other.savedstate
	x = other.savedx
	y = other.savedy
	hsp = other.savedhsp
	vsp = other.savedvsp
	visible = true
}
instance_destroy(instance_nearest(-1000, -1000, obj_cameraRegion))
instance_destroy(instance_nearest(-1000, -1000, obj_solid))
global.preventpause = 0