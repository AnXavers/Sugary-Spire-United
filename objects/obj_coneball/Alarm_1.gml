if (live_call()) return live_result;
if coneballspeed < -0.05
{
	coneballspeed = lerp(coneballspeed, 0, 0.6)
}
else if coneballspeed >= -0.05 && coneballspeed < 0
{
	coneballspeed = 0
}
else if coneballspeed <= 0.95
{
	coneballspeed = lerp(coneballspeed, 1, 0.2)
}
else if coneballspeed > 0.95
{
	coneballspeed = 1
	alarm[1] = -1
	exit;
}
alarm[1] = 10