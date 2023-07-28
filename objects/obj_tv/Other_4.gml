switch (global.levelname)
{
	default:
		current_bg = 0;
		break;
	case "entryway":
		current_bg = 0;
		break;
	case "steamy":
		current_bg = 1;
		break;
	case "molasses":
		current_bg = 2;
		break;
	case "mines":
		current_bg = 3;
		break;
	case "fudge":
		current_bg = 4;
		break;
	case "dance":
		current_bg = 5;
		break;
	case "estate":
		current_bg = 6;
		break;
	case "bee":
		current_bg = 7;
		break;
	case "sucrose":
		current_bg = 8;
		break;
}
if (instance_exists(obj_secretfound))
{
	current_bg = 0;
	tvbg = spr_tvbgsecret;
}
if (!instance_exists(obj_secretfound))
{
	if (global.panic)
		tvbg = spr_tvbgescape;
	else
		tvbg = spr_tvbgs;
}
