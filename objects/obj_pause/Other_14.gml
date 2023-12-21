selected = 0;
playerPauseSprite = spr_pizzelle_pause;
switch (obj_player.character)
{
	case "N":
		playerPauseSprite = spr_pizzano_pause;
		break;
	case "G":
		playerPauseSprite = spr_gumbob_pause;
		break;
	case "C":
		playerPauseSprite = spr_pizzelle_pause;
		break;
	case "T":
		playerPauseSprite = spr_noise_pause;
		break;
	case "RM":
		playerPauseSprite = spr_rosette_pause;
		break;
}
playerCustomPalette = obj_player.custompalette;
playerSPalette = obj_player.custompalette ? obj_player.surf_pallete : obj_player.spr_palette;
playerPalSelect = obj_player.paletteselect;
if (!instance_exists(obj_pausefadeout))
{
	with (instance_create(x, y, obj_pausefadeout))
	{
		fadein = true;
		fadealpha = 0;
	}
}
pausecount = 29;
