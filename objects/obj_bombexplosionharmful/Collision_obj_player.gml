if (image_index > 9)
	exit;
with other
{
	if (state != 22)
	{
		scr_hurtplayer();
		state = 22;
		bombpeptimer = 0;
		sprite_index = spr_pizzelle_bombend;
		image_index = 0;
	}
}