canmove = true;
global.gamePauseState = 0;
i = 0;
color = make_color_rgb(121, 103, 151);
selected = 0;
image_speed = 0;
depth = -98;
draw_screen = 0;
custompal = 0;
pal = 1;
palspr = spr_pal;
bgTileX = 0;
bgTileY = 0;
pauseSurface = -1;
playerCustomPalette = false;
playerSPalette = 583;
playerPalSelect = 0;
playerPauseSprite = spr_pizzelle_pause;
pausecount = -1;
frameref = 0;
switch global.levelname
{
	case "steamy":
		treasurespr = spr_treasure_cotton
		break;
	case "dance":
		treasurespr = spr_treasure_dance
		break;
	case "estate":
		treasurespr = spr_treasure_estate
		break;
	case "fudge":
		treasurespr = spr_treasure_fudge
		break;
	case "martian":
		treasurespr = spr_treasure_martian
		break;
	case "mines":
		treasurespr = spr_treasure_mines
		break;
	case "stormy":
		treasurespr = spr_treasure_stormy
		break;
	case "sucrose":
		treasurespr = spr_treasure_sucrose
		break;
	case "molasses":
		treasurespr = spr_treasure_swamp
		break;
	case "bloodsauce":
		treasurespr = spr_treasure_bloodsauce
		break;
	case "entrance":
		treasurespr = spr_treasure_entrance
		break;
	case "pizzascape":
		treasurespr = spr_treasure_pizzascape
		break;
	case "ancient":
		treasurespr = spr_treasure_ruin
		break;
	default:
		treasurespr = spr_treasure_entryway
		break;
}