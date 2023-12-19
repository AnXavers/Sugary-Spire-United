function button_check(_bound_x1, _bound_y1, _bound_x2, _bound_y2)
{
	var _cursor_x = (mouse_x - obj_camera.Cam_x)
	var _cursor_y = (mouse_y - obj_camera.Cam_y)
	if ((_cursor_x > _bound_x1 && _cursor_x < _bound_x2) && (_cursor_y > _bound_y1 && _cursor_y < _bound_y2))
		return true;
	return false;
}
function button_array_check(_bound_x1, _bound_y1, _bound_x2, _bound_y2, _array_w, _array_h)
{
	var _cursor_x = (mouse_x - obj_camera.Cam_x)
	var _cursor_y = (mouse_y - obj_camera.Cam_y)
	var _active_button = [0, 0]
	if ((_cursor_x > _bound_x1 && _cursor_x < _bound_x2) && (_cursor_y > _bound_y1 && _cursor_y < _bound_y2))
		var _active_button = [floor(((_cursor_x - _bound_x1) / ((_bound_x2 - _bound_x1) / (_array_w)))) + 1, floor(((_cursor_y - _bound_y1) / ((_bound_y2 - _bound_y1) / (_array_h)))) + 1]
	return _active_button;
}