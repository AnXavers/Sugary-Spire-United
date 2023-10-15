switch obj_player.character
{
	case "P":
		charactername = "Pizzelle Suzette"
	case "N":
		charactername = "Pizzano Creampuff"
	case "G":
		charactername = "Gilbert Garcia"
	case "C":
		charactername = "Coneboy"
	case "T":
		charactername = "Theodore Noise"
	case "S":
		charactername = "Peppino Spaghetti"
}
text = "Did you know that your full name is " + charactername + "? That's unfortunate."
idle = spr_tutorialgranny_sleep;
speak = spr_tutorialgranny_talk;
mytex = spr_icepopbg;
