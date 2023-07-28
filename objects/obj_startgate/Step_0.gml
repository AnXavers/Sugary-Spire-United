for (var i = 2; i < image_number; i++)
{
	var ri = i - 2;
	bg_x[ri] += bg_xscroll[ri];
	bg_y[ri] += bg_yscroll[ri];
}
fade = (distance_to_object(obj_player) - 50) / 250;
if (room == hub_w1)
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
showtext = false;
if (distance_to_object(obj_player) < 50)
{
	showtext = true;
	switch (level)
	{
		default:
			with (obj_tv)
			{
				message = string_upper(other.level);
				showtext = 1;
				alarm[0] = 2;
			}
			break;
		case "tutorial":
			with (obj_tv)
			{
				message = "TUTORIAL";
				showtext = 1;
				alarm[0] = 2;
			}
			break;
		case "entryway":
			with (obj_tv)
			{
				message = "ENTRYWAY";
				showtext = 1;
				alarm[0] = 2;
			}
			break;
		case "steamy":
			with (obj_tv)
			{
				message = "COTTONTOWN";
				showtext = 1;
				alarm[0] = 2;
			}
			break;
		case "mines":
			with (obj_tv)
			{
				message = "SUGARSHACK MINES";
				showtext = 1;
				alarm[0] = 2;
			}
			break;
		case "molasses":
			with (obj_tv)
			{
				message = "MOLASSES SWAMP";
				showtext = 1;
				alarm[0] = 2;
			}
			break;
		case "fudge":
			with (obj_tv)
			{
				message = "MT FUDGETOP";
				showtext = 1;
				alarm[0] = 2;
			}
			break;
		case "dance":
			with (obj_tv)
			{
				message = "DANCE OFF";
				showtext = 1;
				alarm[0] = 2;
			}
			break;
		case "sucrose":
			with (obj_tv)
			{
				message = "SUCROSE SNOWSTORM";
				showtext = 1;
				alarm[0] = 2;
			}
			break;
		case "martian":
			with (obj_tv)
			{
				message = "MARTIAN FREEZER";
				showtext = 1;
				alarm[0] = 2;
			}
			break;
		case "bee":
			with (obj_tv)
			{
				message = "STING OPERATION";
				showtext = 1;
				alarm[0] = 2;
			}
			break;
		case "stormy":
			with (obj_tv)
			{
				message = "COTTONSTORM";
				showtext = 1;
				alarm[0] = 2;
			}
			break;
		case "dragonlair":
			with (obj_tv)
			{
				message = "DRAGON ZONE";
				showtext = 1;
				alarm[0] = 2;
			}
			break;
	}
}
