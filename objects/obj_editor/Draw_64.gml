draw_set_font(global.smallfont)
draw_set_halign(fa_left)
draw_set_valign(fa_center)
if !surface_exists(global.toolsurf)
{
	global.toolsurf = surface_create(global.cam_w, 30);
	surface_set_target(global.toolsurf)
	draw_clear(scribble_rgb_to_bgr($04010A))
	draw_set_color(scribble_rgb_to_bgr($141131))
	draw_rectangle(103, 3, global.cam_w - 3, 27, false)
	draw_set_color(c_white)
	draw_text(2, 15, "TOOLBOX")
	surface_reset_target()
}
if !surface_exists(global.layersurf)
{
	global.layersurf = surface_create(140, ((global.cam_h * 0.4) - 30));
	surface_set_target(global.layersurf)
	draw_clear(scribble_rgb_to_bgr($04010A))
	draw_set_color(scribble_rgb_to_bgr($141131))
	draw_rectangle(3, 20, 137, ((global.cam_h * 0.4) - 3), false)
	draw_set_color(c_white)
	draw_text(2, 10, "LAYERS")
	surface_reset_target()
}
if !surface_exists(global.detailssurf)
{
	global.detailssurf = surface_create(140, global.cam_h * 0.6);
	surface_set_target(global.detailssurf)
	draw_clear(scribble_rgb_to_bgr($04010A))
	draw_set_color(scribble_rgb_to_bgr($141131))
	draw_rectangle(3, 20, 137, ((global.cam_h * 0.6) - 3), false)
	draw_set_color(c_white)
	draw_text(2, 10, "DETAILS")
	surface_reset_target()
}
if !surface_exists(global.assetsurf)
{
	global.assetsurf = surface_create(140, ((global.cam_h) - 30));
	surface_set_target(global.assetsurf)
	draw_clear(scribble_rgb_to_bgr($04010A))
	draw_set_color(scribble_rgb_to_bgr($141131))
	draw_rectangle(3, 20, 137, (global.cam_h - 3), false)
	draw_set_color(c_white)
	draw_text(2, 10, "ASSETS")
	surface_reset_target()
}
if !surface_exists(global.customsurf)
{
	global.customsurf = surface_create(global.cam_w - 280, 100);
	surface_set_target(global.customsurf)
	draw_clear(scribble_rgb_to_bgr($04010A))
	draw_set_color(scribble_rgb_to_bgr($141131))
	draw_rectangle(3, 20, (global.cam_w - 283), 97, false)
	draw_set_color(c_white)
	draw_text(2, 10, "OBJECT CREATOR")
	surface_reset_target()
}
surface_set_target(global.layersurf)
draw_set_color(c_white)
for	(var i = 0; i < array_length(global.editorlayers); i++)
{
	var _yoffset = (i * 25)
	draw_set_color(scribble_rgb_to_bgr($04010A))
	draw_rectangle(5, 5 + _yoffset, 135, 25 + _yoffset, 0)
	draw_set_color(c_white)
	draw_text(10, 15 + _yoffset, layer_get_name(global.editorlayers[i]))
}
surface_reset_target()
draw_surface(global.toolsurf, 0, 0)
draw_surface(global.layersurf, 0, 30)
draw_surface(global.detailssurf, 0, (global.cam_h * 0.4))
draw_surface(global.assetsurf, (global.cam_w - 140), 30)
draw_surface(global.customsurf, 140, (global.cam_h - 100))
draw_text(142, 45, "CATEGORY " + selected_category)
draw_text(142, 75, "PLACING " + string_upper(object_get_name(selected_obj)))
draw_text(142, 95, "X " + string(selected_obj_x))
draw_text(142, 125, "Y " + string(selected_obj_y))
draw_text(142, 155, "WIDTH " + string(selected_obj_w))
draw_text(142, 185, "HEIGHT " + string(selected_obj_h))
draw_text(142, 215, "ROTATION  " + string(selected_obj_r))
draw_text(142, 245, "MODE " + string(mode))
draw_sprite(spr_cursor, 0, cursor_x, cursor_y)
draw_set_valign(0)