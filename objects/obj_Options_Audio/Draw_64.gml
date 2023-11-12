draw_set_halign(fa_center);
draw_set_font(global.font);
draw_option(150, 30, "BACK", optionselected == 0);
draw_option(480, 100, "MASTER GAIN", optionselected == 1);
draw_option(480, 150, string(round(optionsaved_masterVolume * 100)), optionselected == 1);
draw_option(480, 200, "MUSIC GAIN", optionselected == 2);
draw_option(480, 250, string(round(optionsaved_musicVolume * 100)), optionselected == 2);
draw_option(480, 300, "SFX GAIN", optionselected == 3);
draw_option(480, 350, string(round(optionsaved_soundVolume * 100)), optionselected == 3);
draw_option(480, 400, "DIALOGUE GAIN", optionselected == 4);
draw_option(480, 450, string(round(optionsaved_dialogueVolume * 100)), optionselected == 4);
draw_set_font(global.smallfont);
var _string_width = string_width(subtitle) + 32;
if (subtitle != "")
	draw_sprite_ext(spr_optionSubtitle, 0, 480, 521, _string_width / 32, 1, 0, c_white, 1);
draw_text(480, 512, subtitle);
