var _halign = draw_get_halign();
var _valign = draw_get_halign();
draw_set_halign(1);
draw_set_halign(1);
draw_set_alpha(1);
draw_set_color(c_white);
if (deactivated == 0)
{
	draw_set_font(global.promptfont);
	if (press_start && room == devroom)
	{
		var _txt = "PRESS START";
		draw_text(480, 298, _txt);
	}
}
else
{
	draw_rectangle_color(0, 0, 960, 540, 0, 0, 0, 0, 0);
	draw_set_font(global.smallfont);
	_txt = "CONTROLLER DISCONNECTED\n\nPRESS START TO CONTINUE";
	var _h = string_height(_txt) / 2;
	draw_text(480, 270 - _h, _txt);
}
if (gamepad_discovered == 1)
{
	draw_set_font(global.smallfont);
	_txt = "A CONTROLLER HAS BEEN FOUND\n\nPRESS START TO ASSIGN IT TO PLAYER";
	draw_set_halign(_halign);
	draw_set_halign(_valign);
	_h = string_height(_txt) / 2;
	draw_text(480, 270 - _h, _txt);
}

// Radix: Fix this later
exit;
if (confirmspr >= 1 && confirmspr < 3)
	draw_sprite_ext(cardspr, carddex, 480, 340, 1, 1, 0, c_white, 1);
