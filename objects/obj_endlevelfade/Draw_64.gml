draw_set_alpha(fadealpha);
draw_set_color(c_white);
draw_rectangle(-64, -64, 1024, 604, false);
draw_set_alpha(1);
draw_set_color(c_white);
if (global.levelname != "none" && global.showplaytimer && !is_hub() && room != timesuproom)
{
	var tiny = ":";
	var tinier = ":";
	var tinyish = ":";
	if (global.playseconds < 10)
		tiny = ":0";
	if (global.playmiliseconds < 10)
		tinier = ":0";
	if (global.playminutes < 10)
		tinyish = ":0";
	draw_set_color(c_white);
	draw_set_halign(0);
	draw_set_font(global.smallfont);
	draw_text(823, 512, string_hash_to_newline(string(global.playhour) + string(tinyish) + string(global.playminutes) + string(tiny) + string(global.playseconds) + string(tinier) + string(global.playmiliseconds)));
}
