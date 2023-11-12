if (_message != "NO ROOMNAME FOUND")
{
	draw_set_font(global.smallfont);
	draw_set_halign(fa_center);
	draw_set_color(c_white);
	draw_set_alpha(alpha);
	draw_sprite(obj_player.spr_roomnamehud, 0, draw_x, newdraw_y);
	draw_set_alpha(1);
	if (string_width(string_upper(_message)) <= maxwidth)
		draw_text(draw_x, newdraw_y, string_upper(_message));
	else
		draw_text_ext(draw_x, newdraw_y - 6, string_upper(_message), -1, maxwidth);
}
