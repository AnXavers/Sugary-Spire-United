if (alpha > 0)
	alpha -= 0.05;
else
	instance_destroy();
switch (type)
{
	default:
		if (alpha > 1)
		{
			image_xscale = approach(image_xscale, 1, 0.1);
			image_yscale = approach(image_yscale, 1, 0.1);
		}
		else
		{
			image_xscale = approach(image_xscale, 5, 0.05);
			image_yscale = approach(image_xscale, 5, 0.05);
		}
		break;
	case 0:
		if (alpha > 1)
		{
			image_xscale = approach(image_xscale, 1, 0.1);
			image_yscale = approach(image_yscale, 1, 0.1);
		}
		else
		{
			image_xscale = alpha;
			image_yscale = alpha;
		}
		break;
	case 3:
		image_xscale = approach(image_xscale, 1, 0.1);
		image_yscale = approach(image_yscale, 1, 0.1);
		if (image_angle != 360)
			image_angle = approach(image_angle, 360, 30);
		break;
}
