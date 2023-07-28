if (state == states.jump)
{
	if (vsp < 20)
		vsp += grav;
	x += hsp;
	y += floor(vsp);
	if (instance_exists(candyID))
	{
		candyID.x = x;
		candyID.y = y;
	}
	platAlpha = approach(platAlpha, 0, 0.05);
}
platIndex += 0.35;
