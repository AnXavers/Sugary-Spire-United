var y_shk = random_range(-1, 1);
if (state == 1)
{
	var txt = hub_array[selected][1];
	var yy = string_height(txt);
	var length = array_length(hub_array);
	draw_set_halign(fa_center);
	draw_set_font(global.font);
	draw_text(480, 400 - (string_height(hub_choosing) / 2) + y_shk, hub_choosing);
	if (!surface_exists(surface2))
		surface2 = surface_create(480, 240);
	surface_set_target(surface2);
	draw_sprite_tiled(bg_menuTile, -1, drawx++, drawy++);
	yy = 40;
	for (var i = 0; i < length; i++)
	{
		txt = hub_array[i][1];
		var c = (selected == i) ? c_white : 8421504;
		draw_text_color(240, yy + ScrollY, txt, c, c, c, c, 1);
		yy += 60;
	}
	draw_set_blend_mode(3);
	draw_sprite(spr_elevatorfadeoff, -1, 0, 0);
	draw_set_blend_mode(0);
	surface_reset_target();
	draw_surface(surface2, 240, 150);
}
else if (state == 2)
{
	draw_sprite_tiled(bg_menuTile, -1, drawx++, drawy++);
	draw_sprite(spr_elevator, selected, 464, 348);
	draw_set_font(global.font);
	draw_set_halign(fa_center);
	var msg = "GOING TO ";
	if selected == 0
		var hubmsg = "FLOOR 5"
	else if selected == 1
		var hubmsg = "FLOOR 4"
	else if selected == 2
		var hubmsg = "FLOOR 3"
	else if selected == 3
		var hubmsg = "FLOOR 2"
	else if selected == 4
		var hubmsg = "FLOOR 1"
	else
		var hubmsg = "THE SPIRE"
	draw_text(480, 400 - (string_height(msg) / 2) + y_shk, (msg + hubmsg));
}