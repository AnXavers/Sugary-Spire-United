if roomid == room
{
	draw_set_halign(fa_center)
	draw_set_font(global.smallfont)
	draw_text(x, y - 60, playername)
	draw_set_alpha(clamp((10 + (timelastmsg / -30)), 0, 1))
	draw_text(x, y - 80, msg)
	draw_set_alpha(1)
	if (!instance_exists(obj_online_server) || (instance_exists(obj_online_server) && (playername != obj_player.playername)))
		draw_self();
}