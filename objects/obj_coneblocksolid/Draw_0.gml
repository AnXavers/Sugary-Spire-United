var h = 0
for (i = 0; i < image_xscale; i += 1)
{
	for (h = 0; h < image_yscale; h += 1)
		draw_sprite(sprite_index, image_index, (xstart + (i * 32)), (ystart + (h * 32)))
}
