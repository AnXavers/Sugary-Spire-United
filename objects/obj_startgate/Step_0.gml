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
	var _lvlname = level
	switch (level)
	{
		case "tutorial":
			_lvlname = "Tutorial"
			break;
		case "entryway":
			_lvlname = "Crunchy Construction"
			break;
		case "steamy":
			_lvlname = "Cottontown"
			break;
		case "mines":
			_lvlname = "Sugarshack Mines"
			break;
		case "molasses":
			_lvlname = "Molasses Swamp"
			break;
		case "fudge":
			_lvlname = "Mt. Fudgetop"
			break;
		case "dance":
			_lvlname = "Dance Off"
			break;
		case "estate":
			_lvlname = "Chocoa Cafe"
			break;
		case "sucrose":
			_lvlname = "Sucrose Snowstorm"
			break;
		case "martian":
			_lvlname = "Martian Outpost"
			break;
		case "bee":
			_lvlname = "Sting Operation"
			break;
		case "exitway":
			_lvlname = "Wafer Deconstruction"
			break;
		case "stormy":
			_lvlname = "Cottonstorm"
			break;
		case "dragonlair":
			_lvlname = "Dragon Zone"
			break;
		case "soursweet":
			_lvlname = "Soursweet Jungle"
			break;
		case "walls":
			_lvlname = "Wafer Walls"
			break;
		case "yogurt":
			_lvlname = "Yogurt's Challenge"
			break;
		case "secrets":
			_lvlname = "Secrets Around the Spire"
			break;
	}
	if !showinfo
		_lvlname = "???"
	scr_controlprompt("[spr_promptfont]" + _lvlname, -4, 1)
}
else
	showtext = false;