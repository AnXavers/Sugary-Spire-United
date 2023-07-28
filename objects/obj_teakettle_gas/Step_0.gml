y += vsp;
image_angle += rot;
if (place_meeting(x, y, obj_teakettle))
	image_alpha = 1;
else
	image_alpha = approach(image_alpha, 0, 0.5);
if (image_alpha == 0)
	instance_destroy();
