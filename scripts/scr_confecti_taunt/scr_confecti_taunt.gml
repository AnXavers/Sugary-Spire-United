function scr_confecti_taunt()
{
	sprite_index = spr_taunt;
	drawxscale = image_xscale;
	if (obj_player.sprite_index != obj_player.spr_taunt)
		state = confectistates.normal;
}
