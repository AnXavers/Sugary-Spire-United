draw_set_halign(1);
draw_set_font(global.font);
if (selected == 0)
{
	draw_option(150, 30, "BACK", optionselected == 0);
	draw_option(480, 100, "MOD MUSIC CONFIG", optionselected == 1);
	draw_option(480, 200, "MOD VISUAL CONFIG", optionselected == 2);
	draw_option(480, 300, "MOD GAMEPLAY CONFIG", optionselected == 3);
	draw_option(480, 300, "ONLINE BETA", optionselected == 4);
	draw_set_font(global.smallfont);
	var _string_width = string_width(subtitle) + 32;
	if (subtitle != "")
		draw_sprite_ext(spr_optionSubtitle, 0, 480, 521, _string_width / 32, 1, 0, c_white, 1);
	draw_text(480, 512, subtitle);
}