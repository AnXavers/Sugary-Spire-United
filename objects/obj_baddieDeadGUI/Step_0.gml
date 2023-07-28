cam_x = camera_get_view_x(view_camera[0]);
cam_y = camera_get_view_y(view_camera[0]);
rx = x - cam_x;
ry = y - cam_y;
if (vsp < 20)
	vsp += grav;
x += hsp;
y += floor(vsp);
if (!alarm[0])
	alarm[0] = 5;
drawx = rx;
drawy = ry;
