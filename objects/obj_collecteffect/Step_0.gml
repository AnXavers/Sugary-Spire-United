var scale = 1.25;
var distance = point_distance(drawx, drawy, targetx, targety);
if (biggening == 1)
	drawxscale = approach(drawxscale, scale, 0.15);
else if (biggening == 0 && distance >= 96)
	drawxscale = approach(drawxscale, 0.85, 0.15);
else
	drawxscale = approach(drawxscale, 0, 0.25);
if (drawxscale == scale)
	biggening = false;
var angle = point_direction(drawx, drawy, targetx, targety);
drawx += lengthdir_x(16, angle);
drawy += lengthdir_y(16, angle);
if (point_in_circle(drawx, drawy, targetx, targety, 32))
{
	with (obj_camera)
		Collectshake = clamp(Collectshake + 1, 2, 5);
	drawx = targetx;
	drawy = targety;
	instance_destroy();
}
drawyscale = drawxscale;
