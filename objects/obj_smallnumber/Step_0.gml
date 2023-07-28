if (scaledraw == 1)
	scale = approach(scale, 0, 0.2);
alpha = approach(alpha, 0, 0.2);
if (scale <= 0 && alpha <= 0)
	instance_destroy();
