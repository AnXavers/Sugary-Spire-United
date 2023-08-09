if (state == 1)
{
	var txt = hub_array[selected][1];
	var yy = string_height(txt);
	var length = array_length(hub_array);
	draw_set_halign(1);
	draw_set_font(global.font);
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
	draw_sprite(spr_elevator, 0, 464, 348);
	draw_set_font(global.font);
	draw_set_halign(1);
	var msg = "GOING TO";
	draw_text(480, 400 - (string_height(msg) / 2), (msg + string(other.hub_array[other.selected])));
}
