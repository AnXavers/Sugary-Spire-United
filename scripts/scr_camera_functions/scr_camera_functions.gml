function point_in_camera()
{
	var cam_x = camera_get_view_x(argument2);
	var cam_y = camera_get_view_y(argument2);
	var cam_w = camera_get_view_width(argument2);
	var cam_h = camera_get_view_height(argument2);
	return point_in_rectangle(argument0, argument1, cam_x, cam_y, cam_x + cam_w, cam_y + cam_h);
}
function bbox_in_camera()
{
	var cam_x = camera_get_view_x(argument0);
	var cam_y = camera_get_view_y(argument0);
	var cam_w = camera_get_view_width(argument0);
	var cam_h = camera_get_view_height(argument0);
	return rectangle_in_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, cam_x, cam_y, cam_x + cam_w, cam_y + cam_h);
}
function bbox_in_camera_ext()
{
	var cam_x = camera_get_view_x(argument0);
	var cam_y = camera_get_view_y(argument0);
	var cam_w = camera_get_view_width(argument0);
	var cam_h = camera_get_view_height(argument0);
	return rectangle_in_rectangle(bbox_left - argument1, bbox_top - argument1, bbox_right + argument1, bbox_bottom + argument1, cam_x, cam_y, cam_x + cam_w, cam_y + cam_h);
}
function camera_shake()
{
	with (obj_camera)
	{
		shake_mag = argument0;
		shake_mag_acc = argument1 / room_speed;
	}
	return true;
}
function camera_get_position_struct(argument0, argument1 = -4) constructor
{
	var _cam_x = camera_get_view_x(argument0);
	var _cam_y = camera_get_view_y(argument0);
	var _cam_width = camera_get_view_width(argument0);
	var _cam_height = camera_get_view_height(argument0);
	centeredcam_x = _cam_x + (_cam_width / 2);
	centeredcam_y = _cam_y + (_cam_height / 2);
	cam_x = _cam_x;
	cam_y = _cam_y;
	if (argument1 != -4)
	{
		centeredcam_x -= argument1[0];
		centeredcam_y -= argument1[1];
	}
}
function screen_flash()
{
	global.screenflash = argument0;
}
function pummel_dim()
{
	
}
