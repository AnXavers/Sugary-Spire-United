if (showtext == 1)
	newdraw_y = approach(newdraw_y, 500, 5);
if (showtext == 0)
	newdraw_y = approach(newdraw_y, 600, 1);
if (instance_exists(obj_player))
{
	if (obj_player.y < (180 + obj_camera.Cam_y) && obj_player.x >= ((obj_camera.Cam_x + (obj_camera.Camera_width / 2)) - 200) && obj_player.x < (obj_camera.Cam_x + (obj_camera.Camera_width / 2) + 200))
		alpha = 0.5;
	else
		alpha = 1;
}
