var a = random_range(-40, 40);
alarm[0] = 5;
instance_create(x + a, y + random_range(-40, 40), obj_machalleffect);
with (create_afterimage(0, image_xscale))
	image_alpha = 0.15;
