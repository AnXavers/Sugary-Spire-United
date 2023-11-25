var character = "Pizzelle Suzette";
switch obj_player.character
{
	case "N":
		character = " is Pizzano Creampuff";
		break;
	case "G":
		character = " is Gumbob Garcia";
		break;
	case "C":
		character = " is Coneboy";
		break;
	case "T":
		character = " is Theodore Noise";
		break;
	case "S":
		character = " is Peppino Spgghetti";
		break;
	case "V":
		character = " is Vigert Lantte";
		break;
	case "M":
		character = " is Phil Pepperman";
		break;
	case "Z":
		character = " is Pizzall";
		break;
	case "RM":
		character = "'s are Rosette Suzette and Marble";
		break;
	case "GB":
		character = "'s are Gustavo and Brick";
		break;
}
text = "Did you know that your full name" + character + "? That's unfortunate."
idle = spr_tutorialgranny_sleep;
speak = spr_tutorialgranny_talk;
mytex = spr_icepopbg;
