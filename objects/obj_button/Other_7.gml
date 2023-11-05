if (currentstate == 2)
{
	currentstate = 1;
	sprite_index = spr_Pressed;
}
else if (currentstate == 3)
{
	currentstate = 0;
	sprite_index = spr_Released;
}
