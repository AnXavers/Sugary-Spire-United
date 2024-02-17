if (!instance_exists(target))
{
	instance_destroy();
	exit;
}
var w = sprite_width / 2;
var h = sprite_height / 2;
x = clamp(target.x, camera_get_view_x(view_camera[0]) + w, (camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])) - w);
y = clamp(target.y, camera_get_view_y(view_camera[0]) + h, (camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])) - h);
var bbox_in_cam = false;
with (target)
	bbox_in_cam = bbox_in_camera(view_camera[0]);
visible = !bbox_in_cam;
if (visible_cond != -4 && !bbox_in_cam)
	visible = visible_cond();
if target == obj_gravplug
{
	if target.activetimer == 0
		instance_destroy()
}