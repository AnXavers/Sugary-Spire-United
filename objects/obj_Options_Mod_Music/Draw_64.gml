draw_set_font(global.font);
draw_set_halign(1);
draw_option(150, 30 + ScrollY, "BACK", optionselected == 0);
draw_set_halign(fa_left);
draw_option(200, 100 + ScrollY, "CUSTOM MUSIC", optionselected == 1);
draw_option(150, 150 + ScrollY, "ON", optionsaved_defaultlap);
draw_option(150, 200 + ScrollY, "OFF", !optionsaved_defaultlap);
draw_option(200, 250 + ScrollY, "LAP 10 MUSIC", optionselected == 2);
draw_option(150, 300 + ScrollY, "SUGARCUBE HAILSTORM", optionsaved_mu_lap10 == 0);
draw_option(150, 350 + ScrollY, "NO MORE NUZZLES", optionsaved_mu_lap10 == 1);
draw_option(150, 400 + ScrollY, "PIZZA MAYHEM", optionsaved_mu_lap10 == 2);
draw_option(150, 450 + ScrollY, "EXTREMELY CRAZIOLI", optionsaved_mu_lap10 == 3);
draw_option(200, 500 + ScrollY, "LAP 5 MUSIC", optionselected == 3);
draw_option(150, 550 + ScrollY, "HARRYS DESPAIRY", optionsaved_mu_lap5 == 0);
draw_option(150, 600 + ScrollY, "PIZZANOS THEMETUNE", optionsaved_mu_lap5 == 1);
draw_option(150, 650 + ScrollY, "PASTA LA VISTA", optionsaved_mu_lap5 == 2);
draw_option(150, 700 + ScrollY, "SUGARY OVERDOSE", optionsaved_mu_lap5 == 3);
draw_option(200, 750 + ScrollY, "LAP 2 MUSIC", optionselected == 4);
draw_option(150, 800 + ScrollY, "SWEET RELEASE OF DEATH", optionsaved_mu_lap2 == 0);
draw_option(150, 850 + ScrollY, "A PIZZANO MEGALO", optionsaved_mu_lap2 == 1);
draw_option(150, 900 + ScrollY, "PESTO ANCHOVI", optionsaved_mu_lap2 == 2);
draw_option(150, 950 + ScrollY, "DEATH THAT I DESERVIOLI", optionsaved_mu_lap2 == 3);
draw_option(200, 1000 + ScrollY, "ESCAPE MUSIC", optionselected == 5);
draw_option(150, 1050 + ScrollY, "GLUCOSE GETAWAY", optionsaved_mu_escape == 0);
draw_option(150, 1100 + ScrollY, "BLUE LICORICE", optionsaved_mu_escape == 1);
draw_option(150, 1150 + ScrollY, "DISTASTEFUL ANCHOVI", optionsaved_mu_escape == 2);
draw_option(150, 1200 + ScrollY, "ITS PIZZA TIME", optionsaved_mu_escape == 3);
draw_option(200, 1250 + ScrollY, "SUGARY OVERDOSE MUSIC", optionselected == 6);
draw_option(150, 1300 + ScrollY, "SUGARY OVERDOSE", !optionsaved_mu_overdose);
draw_option(150, 1350 + ScrollY, "NO MORE NUZZLES", optionsaved_mu_overdose);
draw_option(200, 1400 + ScrollY, "LOWFACE MODE MUSIC", optionselected == 7);
draw_option(150, 1450 + ScrollY, "CHASE ALT", !optionsaved_mu_lowface);
draw_option(150, 1500 + ScrollY, "EXPURGATION", optionsaved_mu_lowface);
draw_set_font(global.smallfont);
draw_set_halign(1);
var _string_width = string_width(subtitle) + 32;
if (subtitle != "")
	draw_sprite_ext(spr_optionSubtitle, 0, 480, 521, _string_width / 32, 1, 0, c_white, 1);
draw_text(480, 512, subtitle);