if (image_index > 9)
	exit;
with other
{
	if (state != states.bombpep)
	{
		scr_hurtplayer();
		state = states.bombpep;
		bombpeptimer = 0;
		sprite_index = spr_pizzelle_bombend;
		image_index = 0;
	}
}