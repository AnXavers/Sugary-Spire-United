scr_palette_as_player()
switch character
{
	case "P":
		sprite_index = spr_player_idle
	case "N":
		sprite_index = spr_pizzano_idle
	case "G":
		sprite_index = spr_gumbob_idle
	case "C":
		sprite_index = spr_coneboy_idle
	case "S":
		sprite_index = spr_player_idle_pep
	case "T":
		sprite_index = spr_Noise_idle
	case "V":
		sprite_index = spr_playerV_idle
	case "M":
		sprite_index = spr_pepperman_idle
	case "RM":
		sprite_index = spr_rosmar_idle
}
pal_swap_reset();