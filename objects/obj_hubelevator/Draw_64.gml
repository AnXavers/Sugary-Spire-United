var y_shk = random_range(-1, 1);
if !surface_exists(surf)
	surf = surface_create(160, 256)
var _arrowangle = (wrap(global.realtime - 21600, -43200, 43200) / 43200) * 80
switch state
{
	case 1:
		surface_set_target(surf)
		draw_sprite(spr_elevatorGUIclock, 0, 0, 0)
		draw_sprite_ext(spr_elevatorGUIarrow, 0, 80, 49, 1, 1, _arrowangle, c_white, 1)
		draw_sprite(spr_elevatorGUI, 0, 0, 0)
		draw_sprite(spr_elevatorGUItop, 0, 0, 0)
		gpu_set_blendenable(true)
		for(var i = 0; i < array_length(hub_array); i++)
		{
			for(var I = 0; I < array_length(hub_array[i]); I++)
			{
				var _isselected = (I == selectedx && i == selectedy)
				draw_sprite_ext(spr_elevatorGUIbuttons, (i * 3) + I + (_isselected * array_length(hub_array) * array_length(hub_array[i])), 37 + (I * 43), 85 + (i * 50), 1, 1, 0, c_white, buttonalpha)
			}
		}
		surface_reset_target()
		draw_surface(surf, (global.cam_w / 4) - (surface_get_width(surf) / 2), (global.cam_h / 2) - (surface_get_height(surf) / 2))
		break;
	case 2:
		draw_sprite_tiled(bg_menuTile, -1, drawx++, drawy++);
		draw_sprite(spr_elevator, 0, 464, 348);
		draw_set_font(global.font);
		draw_set_halign(fa_center);
		var msg = "GOING TO ";
		var hubmsg = hub_array[selectedx][selectedy][1]
		draw_text(480, 400 - (string_height(msg) / 2) + y_shk, (msg + hubmsg));
		break;
	case 3:
		var _drawmiddle = surface_get_width(surf) / 2
		draw_sprite(spr_elevatorGUIclock, 0, _drawmiddle - 80, 0)
		draw_sprite_ext(spr_elevatorGUIarrow, 0, _drawmiddle, 49, 1, 1, _arrowangle, c_white, 1)
		draw_sprite_stretched(spr_elevatorGUI, 0, 0, 0, surface_get_width(surf), surface_get_height(surf))
		draw_sprite(spr_elevatorGUItop, 0, _drawmiddle - 80, 0)
		draw_set_halign(fa_center)
		draw_set_font(global.npcfont)
		draw_set_color(c_black)
		draw_text(_drawmiddle, (surface_get_height(surf) / 2 + 50), "Test text")
		draw_set_halign(fa_left)
		draw_set_color(c_white)
		break;
}