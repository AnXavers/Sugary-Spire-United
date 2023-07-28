image_angle += (spd * dir);
spd = approach(spd, 4, 0.5);
if (place_meeting(x, y, obj_parryhitbox))
{
	if (!once)
	{
		once = true;
		dir *= -1;
	}
}
else
	once = false;
