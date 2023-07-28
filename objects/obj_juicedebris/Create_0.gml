vsp = random_range(-5, -10);
hsp = sign(x - obj_player.x) * random_range(5, 10);
grav = 0.4;
cigar = 0;
stomped = 0;
if (x != obj_player.x)
	image_xscale = -sign(x - obj_player.x);
deadrot = choose(4, 5, 8, 10, -4, -5, -8, -10);
spr_palette = spr_juicePalette;
switch (global.levelname)
{
	case "entryway":
		paletteselect = 1;
		break;
	default:
		paletteselect = 2;
		break;
	case "molasses":
		paletteselect = 3;
		break;
	case "mines":
		paletteselect = 4;
		break;
	case "fudge":
		paletteselect = 5;
		break;
}
