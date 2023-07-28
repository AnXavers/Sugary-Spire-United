event_inherited();
grav = 0.5;
hsp = 0;
vsp = 0;
movespeed = 1;
state = 6;
stunned = 0;
alarm[0] = 150;
roaming = 1;
collectdrop = 5;
flying = 0;
straightthrow = 0;
cigar = 0;
cigarcreate = 0;
stomped = 0;
shot = 0;
thrown = 0;
reset = 0;
flash = 0;
landspr = spr_juicewalk;
idlespr = spr_juicestun;
fallspr = spr_juicewalk;
stunfallspr = spr_juicestun;
walkspr = spr_juicewalk;
turnspr = spr_juicewalk;
recoveryspr = spr_juicewalk;
grabbedspr = spr_juicestun;
scaredspr = spr_juicescared;
deadspr = spr_juicedead;
hp = 1;
slapped = 0;
grounded = 1;
birdcreated = 0;
boundbox = 0;
spr_throw = spr_juice_rage;
throw_frame = 10;
bombreset = 1;
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
	case "dance":
		paletteselect = 6;
		break;
}
