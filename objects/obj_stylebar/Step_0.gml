if !global.heatmeter
	global.style = 0
if (global.style >= 165)
{
	global.stylethreshold = 3;
	if (global.style >= 220)
		global.stylethreshold = 4;
	event_user(0)
}
else if (global.style >= 110)
	global.stylethreshold = 2;
else
{
	global.stylethreshold = 0;
	if (global.style >= 55)
		global.stylethreshold = 1;
	event_user(1)
}
global.style = clamp(global.style, 0, 220);
if (global.combofreeze <= 0)
	global.style -= 0.05;
alpha = obj_tv.alpha;
if (global.stylethreshold != 0)
	image_index += (global.style / 300);
switch (global.stylethreshold)
{
	case 0:
		obj_camera.heatpal = 0;
		image_index = 0;
		break;
	default:
		obj_camera.heatpal = approach(obj_camera.heatpal, global.stylethreshold, 0.2);
		break;
}
switch (floor(image_index))
{
	case 6:
		hudbounce = 3;
		break;
	case 12:
	case 8:
		hudbounce = -1;
		break;
	case 11:
	case 9:
		hudbounce = -2;
		break;
	case 10:
		hudbounce = -3;
		break;
	case 13:
	case 7:
		hudbounce = 0;
		break;
	default:
		hudbounce = floor(image_index);
		break;
}
if (floor(image_index) == 13)
	image_index = 0;
