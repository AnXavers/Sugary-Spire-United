for(var i = 0; i <= room_height; i += 32)
{
	 draw_line(-0.5, i - 0.5, room_width - 0.5, i - 0.5);
}
for(var i = 0; i <= room_width; i += 32)
{
	 draw_line(i - 0.5, -0.5, i - 0.5, room_height - 0.5);
}
var _selected_obj_spr = object_get_sprite(selected_obj)
if !sprite_exists(_selected_obj_spr)
	_selected_obj_spr = spr_wall
if !mouse_check_button(mb_left)
	draw_sprite_ext(_selected_obj_spr, 0, selected_obj_x, selected_obj_y, (selected_obj_w / 32), (selected_obj_h / 32), selected_obj_r, c_white, 1)