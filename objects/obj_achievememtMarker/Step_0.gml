if (picy == 640)
{
	if (kungairtime == 0 && global.kungairtime == 1)
	{
		up = 1;
		sprite = spr_bombblock;
		kungairtime = 1;
		alarm[0] = 250;
		scr_sound(sound_pizzacoin);
	}
}
if (picy == 300)
	up = 0;
if (up == 1)
	picy -= 10;
