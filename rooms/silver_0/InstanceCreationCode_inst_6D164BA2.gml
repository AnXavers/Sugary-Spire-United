flags.do_save = false;
flags.do_once = false;
condition = function()
{
	return place_meeting(x, y, obj_player);
};
output = function()
{
	obj_player.y += 96
	var _cam = view_camera[0]
	camera_set_view_pos(_cam, camera_get_view_x(_cam), (camera_get_view_y(_cam) + 96))
};
