if (instance_exists(baddieID))
{
	image_speed = 0.35;
	image_xscale = baddieID.image_xscale;
	x = baddieID.x;
	y = baddieID.y;
	if (!baddieID.tauntBuffer)
		instance_destroy();
}
else
	instance_destroy();
