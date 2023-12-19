var _cam_middle = (global.cam_h / 2)
var _cam_center = (global.cam_w / 2)
draw_set_alpha(clamp((txtalpha / 20), 0, 1))
draw_sprite_tiled(bg_modifiers, 0, bgTileX, bgTileY);
draw_set_font(global.smallfont);
draw_set_halign(fa_middle)
for (var i = 0; i < 10; i++)
	draw_option((i * 200) + _cam_center - ScrollX, 100, modifiers[i][0], optionselected == i);
for (var i = 0; i < array_length(modifiers[optionselected][1]); i++)
	draw_option(150, _cam_middle + (i * 30) - ScrollY, modifiers[optionselected][1][i], sub_optionselected = i);
draw_text(55, _cam_middle, ">")
draw_text(_cam_center, 70, "V")