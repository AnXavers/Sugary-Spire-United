if !surface_exists(surface)
{
	surface = surface_create(global.cam_w, global.cam_h);
	surface_set_target(surface);
	draw_clear_alpha(0, 0);
	surface_reset_target();
}
surface_set_target(surface);
draw_circle((global.cam_w / 2), (global.cam_h / 2), fadeinrad, false)
gpu_set_colorwriteenable(true, true, true, false);
draw_sprite_tiled(bg_options, 0, bgTileX, bgTileY);
gpu_set_colorwriteenable(true, true, true, true);
surface_reset_target();
draw_surface(surface, 0, 0)
var _cam_middle = (global.cam_h / 2)
draw_set_alpha(clamp((txtalpha / 10), 0, 1))
draw_set_font(global.smallfont);
draw_set_halign(fa_left);
draw_option(75, 0 + _cam_middle - ScrollY, "LEVEL DESIGN", optionselected == 0);
draw_option(75, 30 + _cam_middle - ScrollY, "LAP MODE", optionselected == 1);
draw_option(75, 60 + _cam_middle - ScrollY, "JERALD", optionselected == 2);
draw_set_halign(fa_middle)
var text_leveldesign = "P-RANK"
switch optionsaved_leveldesign
{
	case 1:
		text_leveldesign = "DEV STREAM"
		break;
	case 2:
		text_leveldesign = "DEMO"
		break;
	case 3:
		text_leveldesign = "SSU DEV"
		break;
}
var text_lapmode = "DEFAULT"
switch optionsaved_lapmode
{
	case 1:
		text_lapmode = "INFINITE"
		break;
	case 2:
		text_lapmode = "CHASEDOWN"
		break;
}
var text_jerald = "OFF"
switch optionsaved_jerald
{
	case 1:
		text_jerald = "ON"
		break;
}
draw_option(375, 0 + _cam_middle - ScrollY, text_leveldesign, optionselected == 0);
draw_option(375, 30 + _cam_middle - ScrollY, text_lapmode, optionselected == 1);
draw_option(375, 60 + _cam_middle - ScrollY, text_jerald, optionselected == 2);
draw_text(55, _cam_middle, ">")
draw_text(300, _cam_middle, "<")
draw_text(550, _cam_middle, ">")