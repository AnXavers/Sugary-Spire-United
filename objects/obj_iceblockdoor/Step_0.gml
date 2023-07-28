var found = false;
with (obj_iceblockbutton)
{
	if (trigger == other.trigger)
	{
		if (activated)
			found = true;
	}
}
x = opened ? -100 : xstart;
y = opened ? -100 : ystart;
image_alpha = opened ? 0.33 : 1;
