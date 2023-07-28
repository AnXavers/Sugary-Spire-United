with (other)
{
	if (!other.wasCollected && (state == 48 || state == 49))
	{
		other.wasCollected = true;
		other.alarm[0] = 200;
		sprite_index = spr_player_ufoFloatSpeedUp;
		image_index = 0;
		state = 49;
		ufotimer = min(ufotimer + 150, 750);
	}
}
