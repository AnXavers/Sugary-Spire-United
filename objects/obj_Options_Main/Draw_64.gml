draw_set_halign(fa_center);
draw_set_font(global.font);
draw_sprite_tiled(bg_options, 0, bgx, bgy);
draw_sprite_ext(spr_arrow, -1, CursorX, CursorY + 24, 1, 1, 0, c_white, 1);
if (selected == 0)
{
	draw_option(150, 30, "BACK", optionselected == 0);
	draw_option(480, 100, "AUDIO CONFIG", optionselected == 1);
	draw_option(480, 200, "VIDEO CONFIG", optionselected == 2);
	draw_option(480, 300, "CONTROL CONFIG", optionselected == 3);
	draw_option(480, 400, "MOD CONFIG", optionselected == 4);
	draw_set_font(global.smallfont);
	var _string_width = string_width(subtitle) + 32;
	if (subtitle != "")
		draw_sprite_ext(spr_optionSubtitle, 0, 480, 521, _string_width / 32, 1, 0, c_white, 1);
	draw_text(480, 512, subtitle);
}
