var y_shk = random_range(-1, 1);
if (state == 1)
{
	draw_sprite(spr_elevatorGUI, selected, 200, 140)
}
else if (state == 2)
{
	draw_sprite_tiled(bg_menuTile, -1, drawx++, drawy++);
	draw_sprite(spr_elevator, selected, 464, 348);
	draw_set_font(global.font);
	draw_set_halign(1);
	var msg = "GOING TO ";
	if selected == 0
		var hubmsg = "TOP"
	else if selected == 1
		var hubmsg = "FLOOR 3"
	else if selected == 2
		var hubmsg = "FLOOR 2"
	else if selected == 3
		var hubmsg = "FLOOR 1"
	else if selected == 4
		var hubmsg = "THE BASEMENT"
	draw_text(480, 400 - (string_height(msg) / 2) + y_shk, (msg + hubmsg));
}