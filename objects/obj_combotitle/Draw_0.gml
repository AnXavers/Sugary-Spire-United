if (title != 0 && global.eggplantcombo)
{
	draw_sprite_ext(sprite_index, image_index, obj_player.x, (obj_player.y - 40), image_xscale, image_yscale, image_angle, image_blend, (alpha * 0.7));
	if global.dotruly
		draw_sprite_ext(spr_combotruly, 0, obj_player.x, (obj_player.y - 40), image_xscale, image_yscale, image_angle, image_blend, (alpha * 0.7))
}