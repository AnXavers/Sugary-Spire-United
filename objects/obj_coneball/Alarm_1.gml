if parryspeed < -0.05
	parryspeed = lerp(parryspeed, 0, 0.6)
else if (parryspeed >= -0.05 && parryspeed <= 0.95)
	parryspeed = lerp(parryspeed, 1, 0.2)
else if parryspeed > 0.95
{
	parryspeed = 1
	alarm[1] = -1
	exit;
}
alarm[1] = 10