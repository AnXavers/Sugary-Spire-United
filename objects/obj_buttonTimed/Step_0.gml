if (countdownCounter > 0 && currentState == 1)
{
	countdownCounter--;
	if (countdownCounter <= 0)
	{
		currentState = 3;
		sprite_index = spr_Reverting;
	}
}
