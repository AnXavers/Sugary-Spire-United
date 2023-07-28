scr_collision();
hsp = movespeed * image_xscale;
if (place_meeting_collision(x + image_xscale, y))
	image_xscale *= -1;
if (grounded)
{
	vsp = -4;
	if (!once)
	{
		once = true;
		if (!bounced)
			bounced = true;
		else
			instance_destroy();
	}
}
else
	once = false;
