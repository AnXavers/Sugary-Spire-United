with (other)
{
	if (!other.wasCollected && (state == states.ufofloat || state == states.ufodash))
	{
		other.wasCollected = true;
		other.alarm[0] = 200;
		sprite_index = spr_ufoFloatSpeedUp;
		image_index = 0;
		state = states.ufodash;
		ufotimer = min(ufotimer + 150, 750);
	}
}
