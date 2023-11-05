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
			[spr_steamy_startgate, 4, -0.05, 0.6],
			[spr_steamy_startgate, 3, 0, 0.75],
			[spr_steamy_startgate, 2, 0.1, 0.9]
		]
		break;
	case "molasses":
		bg_details =
		[
			[spr_molasses_startgate, 5, 0, 0.25],
			[spr_molasses_startgate, 4, 0, 0.5],
			[spr_molasses_startgate, 3, 0, 0.75],
			[spr_molasses_startgate, 2, 0.2, 1]
		]
		break;
	case "mines":
		bg_details =
		[
			[spr_mines_startgate, 4, 0, 0.33],
			[spr_mines_startgate, 3, 0, 0.66],
			[spr_mines_startgate, 2, 0, 1]
		]
		break;
	case "fudge":
		bg_details =
		[
			[spr_fudge_startgate, 5, 0, 0],
			[spr_fudge_startgate, 4, 0.2, 0.33],
			[spr_fudge_startgate, 3, 0, 0.66],
			[spr_fudge_startgate, 2, 0, 1]
		]
		break;
	case "dance":
		bg_details =
		[
			[spr_dance_startgate, 4, -0.05, 0.33],
			[spr_dance_startgate, 3, 0, 0.66],
			[spr_dance_startgate, 2, 0.1, 1]
		]
		break;
	case "estate":
		bg_details =
		[
			[spr_chocoa_startgate, 5, 0, 0.11],
			[spr_chocoa_startgate, 4, 0, 0],
			[spr_chocoa_startgate, 3, 0, 0.33],
			[spr_chocoa_startgate, 2, 0, 0.55]
		]
		break;
	case "bee":
		bg_details =
		[
			[spr_bee_startgate, 7, 0, 0],
			[spr_bee_startgate, 6, 0, 0.35],
			[spr_bee_startgate, 5, -0.4, 0.45],
			[spr_bee_startgate, 4, -0.05, 0.6],
			[spr_bee_startgate, 3, 0, 0.75],
			[spr_bee_startgate, 2, 0.1, 0.9]
		]
		break;
	case "sucrose":
		bg_details =
		[
			[spr_sucrose_startgatebg, -1, 0, 0],
			[spr_sucrose_startgate, 4, 0, 0.33],
			[spr_sucrose_startgate, 3, 0, 0.66],
			[spr_sucrose_startgate, 2, 0, 1]
		]
		break;
	case "entrance":
		bg_details =
		[
			[spr_gate_entranceBG, 0, 0, 0.25],
			[spr_gate_entranceBG, 1, 0.1, 0.5],
			[spr_gate_entranceBG, 2, 0, 0.75]
		]
		break;
	case "bloodsauce":
		bg_details =
		[
			[spr_gate_dungeonBG, 0, 0, 0.25],
			[spr_gate_dungeonBG, 1, 0, 0.6]
		]
		break;
	case "ancient":
		bg_details =
		[
			[spr_sucrose_startgate, 7, 0, 0],
			[spr_sucrose_startgate, 6, 0, 0.35],
			[spr_sucrose_startgate, 5, -0.4, 0.45],
			[spr_sucrose_startgate, 4, -0.05, 0.6],
			[spr_sucrose_startgate, 3, 0, 0.75],
			[spr_sucrose_startgate, 2, 0.1, 0.9]
		]
		break;
	case "pizzascape":
		bg_details =
		[
			[spr_sucrose_startgate, 7, 0, 0],
			[spr_sucrose_startgate, 6, 0, 0.35],
			[spr_sucrose_startgate, 5, -0.4, 0.45],
			[spr_sucrose_startgate, 4, -0.05, 0.6],
			[spr_sucrose_startgate, 3, 0, 0.75],
			[spr_sucrose_startgate, 2, 0.1, 0.9]
		]
		break;
	case "tutorial":
		bg_details =
		[
			[spr_tutorial_startgate, 4, 0.15, 0.15],
			[spr_tutorial_startgate, 3, 0, 0.35],
			[spr_tutorial_startgate, 2, -0.3, 0.5]
		]
		break;
	case "exitway":
		bg_details =
		[
			[spr_sucrose_startgate, 7, 0, 0],
			[spr_sucrose_startgate, 6, 0, 0.35],
			[spr_sucrose_startgate, 5, -0.4, 0.45],
			[spr_sucrose_startgate, 4, -0.05, 0.6],
			[spr_sucrose_startgate, 3, 0, 0.75],
			[spr_sucrose_startgate, 2, 0.1, 0.9]
		]
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
