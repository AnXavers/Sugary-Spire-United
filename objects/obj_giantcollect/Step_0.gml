if (collectvanish == 1 && collectboxid.activated == 1)
{
	x = xstart;
	y = ystart;
	instance_create(x + (sprite_width / 2), y + (sprite_height / 2), obj_cloudeffect);
	repeat (3)
		instance_create(((x + (sprite_width / 2)) + random_range(-5, 5)), ((y + (sprite_height / 2)) + random_range(-5, 5)), obj_cloudeffect)
	collectvanish = false;
	in_the_void = false;
}
if (global.collectsound < 10)
	global.collectsound++;
