stuntouch--;
stuntouch = max(0, stuntouch);
if (squashedx == 1)
{
	squashvalx = approach(squashvalx, 0.4, 0.15);
	if (squashvalx >= 0.4)
		squashedx = false;
}
else if (squashedx == 0)
	squashvalx = approach(squashvalx, 0, 0.05);
scr_collide();
