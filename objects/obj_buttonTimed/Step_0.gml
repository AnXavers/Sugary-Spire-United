if (countdownCounter > 0 && currentstate == 1)
{
	countdownCounter--;
	if (countdownCounter <= 0)
	{
		currentstate = 3;
		sprite_index = spr_Reverting;
	}
}
