if (global.style >= 220)
	global.stylethreshold = 4;
else if (global.style >= 165)
	global.stylethreshold = 3;
else if (global.style >= 110)
	global.stylethreshold = 2;
else if (global.style >= 55)
	global.stylethreshold = 1;
else
	global.stylethreshold = 0;
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
	case 1:
		obj_camera.heatpal = approach(obj_camera.heatpal, 1, 0.2);
		break;
	case 2:
		obj_camera.heatpal = approach(obj_camera.heatpal, 2, 0.2);
		break;
	case 3:
		obj_camera.heatpal = approach(obj_camera.heatpal, 3, 0.2);
		break;
	case 4:
		obj_camera.heatpal = approach(obj_camera.heatpal, 4, 0.2);
		break;
}
switch (floor(image_index))
{
	case 0:
		hudbounce = 0;
		break;
	case 1:
		hudbounce = 1;
		break;
	case 2:
		hudbounce = 2;
		break;
	case 3:
		hudbounce = 3;
		break;
	case 4:
		hudbounce = 4;
		break;
	case 5:
		hudbounce = 5;
		break;
	case 6:
		hudbounce = 3;
		break;
	case 7:
		hudbounce = 0;
		break;
	case 8:
		hudbounce = -1;
		break;
	case 9:
		hudbounce = -2;
		break;
	case 10:
		hudbounce = -3;
		break;
	case 11:
		hudbounce = -2;
		break;
	case 12:
		hudbounce = -1;
		break;
	case 13:
		hudbounce = 0;
		break;
}
if (floor(image_index) == 13)
	image_index = 0;
