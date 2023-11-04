switch (global.levelname)
{
	default:
		for (var i = 0; i < array_length(bg_details); i++)
			array_delete(bg_details, i, 4)
	case "entryway":
		bg_details =
		[
			[spr_entry_startgate, 5, 0, 0],
			[spr_entry_startgate, 4, 0.25, 0.15],
			[spr_entry_startgate, 3, 0.5, 0.35],
			[spr_entry_startgate, 2, 0, 0.5]
		]
		break;
	case "steamy":
		bg_details =
		[
			[spr_steamy_startgate, 7, 0, 0],
			[spr_steamy_startgate, 6, 0, 0.35],
			[spr_steamy_startgate, 5, -0.4, 0.45],
			[spr_steamy_startgate, 4, -0.05, 0.60],
			[spr_steamy_startgate, 3, 0, 0.75],
			[spr_steamy_startgate, 2, 0.1, 0.9]
		]
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
	case "entrance":
		current_bg = 0;
		break;
	case "bloodsauce":
		current_bg = 3;
		break;
	case "exitway":
		current_bg = 0;
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
