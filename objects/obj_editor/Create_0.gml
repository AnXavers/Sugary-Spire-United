if is_undefined(global.editorinsts)
	global.editorinsts = []
x = 0
y = 0
depth = -900
mode = 1
selected_category = "NONE"
selected_obj = obj_solid
cursor_x = 0
cursor_y = 0
selected_obj_x = 0
selected_obj_y = 0
selected_obj_h = 32
selected_obj_w = 32
selected_obj_r = 0
object_list = [
["COLLISION", obj_solid, obj_slope, obj_platform, obj_sidePlatform, obj_slopePlatform, obj_movingPlatform, obj_movingPlatformTrigger, obj_movingPlatform_attach],
[],
[],
[],
[]
]
buttons_mode = [0, 0]
for	(var i = 0; i < array_length(global.editorinsts); i++)
{
	with global.editorinsts[i]
	{
		with instance_create(x, y, obj_editor_decoy)
		{
			sprite_index = other.sprite_index
			image_xscale = other.image_xscale
			image_yscale = other.image_yscale
			image_angle = other.image_angle
			visible = true
			obj = other.object_index
		}
		instance_destroy();
	}
}
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
with instance_create(-1000, -1000, obj_cameraRegion)
{
	ClampTop = false
	ClampBottom = false
	ClampLeft = false
	ClampRight = false
}
global.preventpause = 1