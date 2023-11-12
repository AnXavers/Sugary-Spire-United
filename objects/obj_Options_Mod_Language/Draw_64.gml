draw_set_font(global.font);
draw_set_halign(fa_center);
draw_option(150, 30 + ScrollY, "BACK", optionselected == 0);
draw_option(480, 100 + ScrollY, "LANGUAGE", optionselected == 1);
draw_option(480, 150 + ScrollY, "ENGLISH", optionsaved_language == 0);
draw_option(480, 200 + ScrollY, "ESPANOL", optionsaved_language == 1);
draw_option(480, 250 + ScrollY, "PORTUGUES", optionsaved_language == 2);
draw_option(480, 300 + ScrollY, "FRENCH", optionsaved_language == 3);
draw_set_font(global.smallfont);
draw_set_halign(fa_center);
var _string_width = string_width(subtitle) + 32;
if (subtitle != "")
	draw_sprite_ext(spr_optionSubtitle, 0, 480, 521, _string_width / 32, 1, 0, c_white, 1);
draw_text(480, 512, subtitle);
