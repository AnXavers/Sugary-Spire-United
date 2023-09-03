function scr_exitlevellocation(argument0 = global.levelname)
{
	switch (argument0)
	{
		case "tutorial":
			global.entergateroom = hub_hallway;
			global.entergatedoor = "Z";
			break;
		case "entryway":
			if !global.isoldw1
				global.entergateroom = hub_w1;
			else
				global.entergateroom = hub_w1old;
			global.entergatedoor = "W";
			break;
		case "steamy":
			if !global.isoldw1
				global.entergateroom = hub_w1;
			else
				global.entergateroom = hub_w1old;
			global.entergatedoor = "X";
			break;
		case "molasses":
			if !global.isoldw1
				global.entergateroom = hub_w1;
			else
				global.entergateroom = hub_w1old;
			global.entergatedoor = "Y";
			break;
		case "mines":
			if !global.isoldw1
				global.entergateroom = hub_w1;
			else
				global.entergateroom = hub_w1old;
			global.entergatedoor = "Z";
			break;
		case "souractive":
			global.entergateroom = hub_w2;
			global.entergatedoor = "U";
			break;
		case "sucrose":
			global.entergateroom = hub_w3;
			global.entergatedoor = "Z";
			break;
		case "fudge":
			global.entergateroom = hub_w2
			global.entergatedoor = "V"
			break;
		case "estate":
			global.entergateroom = hub_w2
			global.entergatedoor = "W"
			break;
		case "martian":
			global.entergateroom = hub_w2
			global.entergatedoor = "X"
			break;
		case "dance":
			global.entergateroom = hub_w2
			global.entergatedoor = "Y"
			break;
		case "bee":
			global.entergateroom = hub_w2
			global.entergatedoor = "Z"
			break;
		case "entrance":
			global.entergateroom = tower_johngutterhall
			global.entergatedoor = "Z"
			break;
		case "pizzascape":
			global.entergateroom = tower_1
			global.entergatedoor = "X"
			break;
		case "ancient":
			global.entergateroom = tower_1
			global.entergatedoor = "Y"
			break;
		case "bloodsauce":
			global.entergateroom = tower_1
			global.entergatedoor = "Z"
			break;
		case "exitway":
			global.entergateroom = hub_basement
			global.entergatedoor = "X"
			break;
		case "dragonlair":
			global.entergateroom = hub_basement
			global.entergatedoor = "Y"
			break;
		case "walls":
			global.entergateroom = hub_basement
			global.entergatedoor = "Z"
			break;
		case "soursweet":
			global.entergateroom = hub_basement
			global.entergatedoor = "Z"
			break;
		case "themepark":
			global.entergateroom = hub_basement
			global.entergatedoor = "Z"
			break;
		case "catacomb":
			global.entergateroom = hub_basement
			global.entergatedoor = "Z"
			break;
		case "finale":
			global.entergateroom = hub_outside
			global.entergatedoor = "Z"
			break;
	}
}
