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
["BADDIES", obj_solid],
["WIRING", obj_solid],
["TRIGGERS", obj_solid],
["GIMMICKS", obj_solid],
["CUSTOM", obj_solid]
]
for	(var i = 0; i < array_length(global.editorinsts); i++)
{
	with global.editorinsts[i]
	{
		if global.editorinsts[i] != -4
		{
			var saved_spr = global.editorinsts[i].sprite_index
			with instance_change(obj_editor_decoy, false)
			{
				sprite_index = saved_spr
			}
		}
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
draw_set_font(global.smallfont)
draw_set_halign(fa_left)
draw_set_valign(fa_center)
global.toolsurf = surface_create(global.cam_w, 30);
surface_set_target(global.toolsurf)
draw_clear(scribble_rgb_to_bgr($04010A))
draw_set_color(scribble_rgb_to_bgr($141131))
draw_rectangle(103, 3, global.cam_w - 3, 27, false)
draw_set_color(c_white)
draw_text(2, 15, "TOOLBOX")
surface_reset_target()
global.layersurf = surface_create(140, ((global.cam_h * 0.4) - 30));
surface_set_target(global.layersurf)
draw_clear(scribble_rgb_to_bgr($04010A))
draw_set_color(scribble_rgb_to_bgr($141131))
draw_rectangle(3, 20, 137, ((global.cam_h * 0.4) - 3), false)
draw_set_color(c_white)
draw_text(2, 10, "LAYERS")
surface_reset_target()
global.detailssurf = surface_create(140, global.cam_h * 0.6);
surface_set_target(global.detailssurf)
draw_clear(scribble_rgb_to_bgr($04010A))
draw_set_color(scribble_rgb_to_bgr($141131))
draw_rectangle(3, 20, 137, ((global.cam_h * 0.6) - 3), false)
draw_set_color(c_white)
draw_text(2, 10, "DETAILS")
surface_reset_target()
global.assetsurf = surface_create(140, ((global.cam_h) - 30));
surface_set_target(global.assetsurf)
draw_clear(scribble_rgb_to_bgr($04010A))
draw_set_color(scribble_rgb_to_bgr($141131))
draw_rectangle(3, 20, 137, (global.cam_h - 3), false)
draw_set_color(c_white)
draw_text(2, 10, "ASSETS")
surface_reset_target()
global.customsurf = surface_create(global.cam_w - 280, 100);
surface_set_target(global.customsurf)
draw_clear(scribble_rgb_to_bgr($04010A))
draw_set_color(scribble_rgb_to_bgr($141131))
draw_rectangle(3, 20, (global.cam_w - 283), 97, false)
draw_set_color(c_white)
draw_text(2, 10, "OBJECT CREATOR")
surface_reset_target()