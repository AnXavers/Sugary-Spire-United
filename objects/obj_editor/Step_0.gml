scr_getinput()
x += (key_right + key_left) * 4 * (key_attack + 1)
y += (key_down - key_up) * 4 * (key_attack + 1)
if mouse_check_button_pressed(mb_left)
{
	with instance_create(selected_obj_x, selected_obj_y, selected_obj)
		visible = true
}
with obj_cameraRegion
{
	var _shift_not_held = !keyboard_check(vk_shift)
	if (mouse_wheel_up())
	{
		if _shift_not_held
			zoom -= (0.1 * zoom)
		else
			other.selected_obj += 1
	}
	if (mouse_wheel_down())
	{
		if _shift_not_held
			zoom += (0.1 * zoom)
		else
			other.selected_obj -= 1
	}
	zoom = clamp(zoom, 0.2, 10)
}
var _object_num = ((array_length(global.objectlist)) - 1)
var _zoom = obj_cameraRegion.zoom
selected_obj = wrap(other.selected_obj, 0, _object_num)
cursor_x = ((window_mouse_get_x()) * (window_get_width() / (global.cam_w * 4)))
cursor_y = ((window_mouse_get_y()) * (window_get_height() / (global.cam_h * 4)))
selected_obj_x = (floor(((window_mouse_get_x()) * (((window_get_width() / (global.cam_w * 4))) * _zoom) + camera_get_view_x(view_camera[0])) / 32) * 32)
selected_obj_y = (floor(((window_mouse_get_y()) * (((window_get_height() / (global.cam_h * 4))) * _zoom) + camera_get_view_y(view_camera[0])) / 32) * 32)
if (keyboard_check_pressed(vk_escape) && !instance_exists(obj_shell))
	instance_destroy()