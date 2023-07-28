if (image_index != Selection)
{
	image_index = Selection;
	alarm[0] = 60;
	fadeout = false;
}
if (fadeout && image_index == 0)
	image_alpha = clamp(image_alpha - 0.05, 0, 1);
else
	image_alpha = 1;
y = ystart + wave(5, -5, 1, 0);
