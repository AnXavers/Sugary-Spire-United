if (title != 0 && global.eggplantcombo)
{
	var _trulystack = floor(dotruly / 3)
	draw_sprite_ext(sprite_index, image_index, obj_player.x, (obj_player.y - 40) + (_trulystack * 25), image_xscale, image_yscale, image_angle, image_blend, (alpha * 0.7));
	for	(var i = 0; i < dotruly; i++)
	{
		draw_sprite_ext(spr_combotruly, 0, x + (wrap(i, 0, 2) * 50) - 50, y + (floor(i / 3) * 25), image_xscale, image_yscale, image_angle, image_blend, alpha)
	}
}