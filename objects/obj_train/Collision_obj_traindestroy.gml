if (state == 1)
{
	if (sprite_index != spr_spraydie && scr_solid(x + image_xscale, y, true))
	{
		sprite_index = spr_spraydie;
		image_index = 0;
	}
}
