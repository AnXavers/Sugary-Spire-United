if (currentState == 2)
{
	currentState = 1;
	sprite_index = spr_Pressed;
}
else if (currentState == 3)
{
	currentState = 0;
	sprite_index = spr_Released;
}
