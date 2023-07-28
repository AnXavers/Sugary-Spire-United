if (!active)
	exit;
oldx = x;
oldy = y;
hsp = round(lengthdir_x(movespeed - stopSpeed, targetDirection));
vsp = round(lengthdir_y(movespeed - stopSpeed, targetDirection));
TrueX += hsp;
TrueY += vsp;
x = round(TrueX);
y = round(TrueY);
if (place_meeting(x + sign(hsp), y + sign(vsp), obj_movingPlatformTrigger) && stopped == 0)
{
	with (instance_place(x + sign(hsp), y + sign(vsp), obj_movingPlatformTrigger))
	{
		if (other.stopid != id)
		{
			other.platformDirection = targetAngle;
			other.stopped = true;
			other.stopid = id;
		}
	}
}
if (stopped == 1)
{
	stopSpeed = approach(stopSpeed, stopSpeedMax, stopSpeedAcc);
	if (stopSpeed >= stopSpeedMax)
	{
		targetDirection = platformDirection;
		stopped = false;
	}
}
else
	stopSpeed = approach(stopSpeed, 0, stopSpeedDecc);
