targetx = obj_player.x;
targety = obj_player.y;
if (following)
	direction = angle_rotate(direction, point_direction(x, y, targetx, targety), 3);
if (!bbox_in_camera_ext(view_camera[0], 300))
	instance_destroy();
