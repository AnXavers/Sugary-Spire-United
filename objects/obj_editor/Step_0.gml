scr_getinput()
var _zoom = obj_cameraRegion.zoom
x += ((key_right + key_left) * 4 * (key_attack + 1)) * _zoom
y += ((key_down - key_up) * 4 * (key_attack + 1)) * _zoom
if mouse_check_button_pressed(mb_left)
{
	with instance_create(selected_obj_x, selected_obj_y, selected_obj)
	{
		visible = true
		image_xscale = other.selected_obj_w
		image_yscale = other.selected_obj_h
		phy_rotation = other.selected_obj_r
	}
}
var _shift_held = keyboard_check(vk_shift)
var _ctrl_held = keyboard_check(vk_control)
var _1_held = keyboard_check(ord("1"))
var _2_held = keyboard_check(ord("2"))
var _3_held = keyboard_check(ord("3"))
if (mouse_wheel_up())
{
	if _1_held
	{
		if _shift_held
			selected_obj_w += 2
		else if _ctrl_held
			selected_obj_w += 0.1
		else
			selected_obj_w += 1
	}
	else if _2_held
	{
		if _shift_held
			selected_obj_h += 2
		else if _ctrl_held
			selected_obj_h += 0.1
		else
			selected_obj_h += 1
	}
	else if _3_held
	{
		if _shift_held
			selected_obj_r += 10
		else if _ctrl_held
			selected_obj_r += 1
		else
			selected_obj_r += 5
	}
	else if _shift_held
		selected_obj += 1
	else
		_zoom -= (0.1 * _zoom)
}
if (mouse_wheel_down())
{
	if _1_held
	{
		if _shift_held
			selected_obj_w -= 2
		else if _ctrl_held
			selected_obj_w -= 0.1
		else
			selected_obj_w -= 1
	}
	else if _2_held
	{
		if _shift_held
			selected_obj_h -= 2
		else if _ctrl_held
			selected_obj_h -= 0.1
		else
			selected_obj_h -= 1
	}
	else if _3_held
	{
		if _shift_held
			selected_obj_r -= 10
		else if _ctrl_held
			selected_obj_r -= 1
		else
			selected_obj_r -= 5
	}
	else if _shift_held
		selected_obj -= 1
	else
		_zoom += (0.1 * _zoom)
}
_zoom = clamp(_zoom, 0.2, 10)
var _object_num = ((array_length(global.objectlist)) - 1)
selected_obj = wrap(selected_obj, 0, _object_num)
selected_obj_r = wrap(selected_obj_r, 0, 360)
cursor_x = ((window_mouse_get_x()) * (window_get_width() / (global.cam_w * 4)))
cursor_y = ((window_mouse_get_y()) * (window_get_height() / (global.cam_h * 4)))
selected_obj_x = (floor(((window_mouse_get_x()) * (((window_get_width() / (global.cam_w * 4))) * _zoom) + camera_get_view_x(view_camera[0])) / 32) * 32)
selected_obj_y = (floor(((window_mouse_get_y()) * (((window_get_height() / (global.cam_h * 4))) * _zoom) + camera_get_view_y(view_camera[0])) / 32) * 32)
obj_cameraRegion.zoom = _zoom
if (keyboard_check_pressed(vk_escape) && !instance_exists(obj_shell))
	instance_destroy()