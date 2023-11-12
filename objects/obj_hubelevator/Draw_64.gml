var y_shk = random_range(-1, 1);
if (state == 1)
{
	draw_sprite(spr_elevatorGUI, selected, 300, 140)
}
else if (state == 2)
{
	draw_sprite_tiled(bg_menuTile, -1, drawx++, drawy++);
	draw_sprite(spr_elevator, selected, 464, 348);
	draw_set_font(global.font);
	draw_set_halign(fa_center);
	var msg = "GOING TO ";
	var hubmsg = hub_array[selected][1]
	draw_text(480, 400 - (string_height(msg) / 2) + y_shk, (msg + hubmsg));
}