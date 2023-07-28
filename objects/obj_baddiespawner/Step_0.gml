scr_collide();
if (!instance_exists(baddieid))
{
	if (--refresh <= 0)
	{
		image_speed = 1;
		if (floor(image_index) >= 5)
			event_user(0);
	}
}
