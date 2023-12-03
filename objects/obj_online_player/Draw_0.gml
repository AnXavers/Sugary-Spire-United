if roomid == room
{
	draw_set_halign(fa_center)
	draw_set_font(global.smallfont)
	draw_text(x, y - 60, playername)
	if (playerid != string(obj_player.id) && sprite_exists(sprite_index))
		draw_self();
}