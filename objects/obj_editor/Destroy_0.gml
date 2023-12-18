with obj_editor_decoy
	instance_change(obj, true)
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