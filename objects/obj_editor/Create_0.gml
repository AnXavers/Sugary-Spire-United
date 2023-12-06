with obj_player
{
	other.savedstate = state
	other.savedx = x
	other.savedy = y
	other.savedhsp = hsp
	other.savedvsp = vsp
	state = states.actor
	x = -900
	y = -900
	hsp = 0
	vsp = 0
	visible = false
}
with instance_create(-1000, -1000, obj_solid)
{
	image_xscale = 10
	image_yscale = 10
}
x = 0
y = 0
depth = -900
selected_obj = obj_solid
cursor_x = 0
cursor_y = 0
selected_obj_x = 0
selected_obj_y = 0
with instance_create(-1000, -1000, obj_cameraRegion)
{
	ClampTop = false
	ClampBottom = false
	ClampLeft = false
	ClampRight = false
}