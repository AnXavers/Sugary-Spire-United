alpha -= 0.09
image_alpha = clamp(alpha, 0, 1)
if image_alpha == 0
	instance_destroy()