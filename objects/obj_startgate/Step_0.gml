for (var i = 2; i < image_number; i++)
{
	var ri = i - 2;
	bg_x[ri] += bg_xscroll[ri];
	bg_y[ri] += bg_yscroll[ri];
}
fade = (distance_to_object(obj_player) - 50) / 250;
if (is_hub())
{
	with (obj_player)
		var d = distance_to_object(obj_startgate);
	var l = layer_get_id("Backgrounds_H1");
	var b = layer_background_get_id(l);
	if (d < 200)
		layer_background_alpha(b, 1 - (d / 200));
	else
		layer_background_alpha(b, 0);
}
if ((place_meeting(x, y, obj_player)) && (obj_player.state != states.victory))
{
	showtext = true;
	switch (level)
	{
		case "tutorial":
			scr_controlprompt("[spr_promptfont]Tutorial", -4, 10)
			break;
		case "entryway":
			scr_controlprompt("[spr_promptfont]Crunchy Construction", -4, 10)
			break;
		case "steamy":
			scr_controlprompt("[spr_promptfont]Cottontown", -4, 10)
			break;
		case "mines":
			scr_controlprompt("[spr_promptfont]Sugarshack Mines", -4, 10)
			break;
		case "molasses":
			scr_controlprompt("[spr_promptfont]Molasses Swamp", -4, 10)
			break;
		case "fudge":
			scr_controlprompt("[spr_promptfont]Mt. Fudgetop", -4, 10)
			break;
		case "dance":
			scr_controlprompt("[spr_promptfont]Dance Off", -4, 10)
			break;
		case "sucrose":
			scr_controlprompt("[spr_promptfont]Sucrose Snowstorm", -4, 10)
			break;
		case "martian":
			scr_controlprompt("[spr_promptfont]Martian Outpost", -4, 10)
			break;
		case "bee":
			scr_controlprompt("[spr_promptfont]Sting Operation", -4, 10)
			break;
		case "exitway":
			scr_controlprompt("[spr_promptfont]Wafer Deconstruction", -4, 10)
			break;
		case "stormy":
			scr_controlprompt("[spr_promptfont]Cottonstorm", -4, 10)
			break;
		case "dragonlair":
			scr_controlprompt("[spr_promptfont]Dragon Zone", -4, 10)
			break;
		case "yogurt":
			scr_controlprompt("[spr_promptfont]Yogurt's Challenge", -4, 10)
			break;
		default:
			scr_controlprompt(string_upper(other.level), -4, 10)
			break;
	}
}
else
	showtext = false;