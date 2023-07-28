if (timer_countdown > 0)
{
	timer_countdown--;
	alarm[3] = 60;
}
else
{
	sprite_index = spr_throw;
	image_index = 0;
	hsp = 0;
	bombreset = 0;
	state = 7;
}
