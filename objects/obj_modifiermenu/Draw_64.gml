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
draw_option(75, 0 + _cam_middle - ScrollY, "GAMEMODE", optionselected == 0);
draw_option(75, 30 + _cam_middle - ScrollY, "LEVEL DESIGN", optionselected == 1);
draw_option(75, 60 + _cam_middle - ScrollY, "LAP MODE", optionselected == 2);
draw_option(75, 90 + _cam_middle - ScrollY, "JERALD", optionselected == 3);
draw_option(75, 120 + _cam_middle - ScrollY, "PERFECT", optionselected == 4);
draw_option(75, 150 + _cam_middle - ScrollY, "FLASHLIGHT", optionselected == 5);
draw_option(75, 180 + _cam_middle - ScrollY, "COLLECTS", optionselected == 6);
draw_option(75, 210 + _cam_middle - ScrollY, "DESTROYABLES", optionselected == 7);
draw_option(75, 240 + _cam_middle - ScrollY, "ENEMIES", optionselected == 8);
draw_option(75, 270 + _cam_middle - ScrollY, "ESCAPE TIMER", optionselected == 9);
draw_set_halign(fa_middle)
var text_gamemode = "DEFAULT"
switch optionsaved_gamemode
{
	case 1:
		text_gamemode = "SUGARY GETAWAY"
		break;
	case 2:
		text_gamemode = "HYPERGLYCEMIC GETAWAY"
		break;
	case 3:
		text_gamemode = "TIME TRIAL"
		break;
	case 4:
		text_gamemode = "CONE-GAL"
		break;
}
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
		text_leveldesign = "SSU"
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
	case 3:
		text_lapmode = "OFF"
		break;
}
var text_jerald = "OFF"
switch optionsaved_jerald
{
	case 1:
		text_jerald = "ON"
		break;
}
var text_perfect = "OFF"
switch optionsaved_perfect
{
	case 1:
		text_perfect = "D-RANK"
		break;
	case 2:
		text_perfect = "C-RANK"
		break;
	case 3:
		text_perfect = "B-RANK"
		break;
	case 4:
		text_perfect = "A-RANK"
		break;
	case 5:
		text_perfect = "S-RANK"
		break;
	case 6:
		text_perfect = "P-RANK"
		break;
	case 7:
		text_perfect = "E-RANK"
		break;
}
var text_flashlight = "OFF"
switch optionsaved_flashlight
{
	case 1:
		text_flashlight = "ON"
		break;
}
var text_collects = "OFF"
switch optionsaved_collects
{
	case 1:
		text_collects = "ON"
		break;
}
var text_breakables = "OFF"
switch optionsaved_breakables
{
	case 1:
		text_breakables = "ON"
		break;
}
var text_enemies = "OFF"
switch optionsaved_enemies
{
	case 1:
		text_enemies = "ON"
		break;
}
var text_escapetimer = "DEFAULT"
switch optionsaved_escapetimer
{
	case 1:
		text_escapetimer = "STANDARD"
		break;
	case 2:
		text_escapetimer = "SUCROSE"
		break;
	case 3:
		text_escapetimer = "YOGURT"
		break;
}
draw_option(425, 0 + _cam_middle - ScrollY, text_gamemode, optionselected == 0);
draw_option(425, 30 + _cam_middle - ScrollY, text_leveldesign, optionselected == 1);
draw_option(425, 60 + _cam_middle - ScrollY, text_lapmode, optionselected == 2);
draw_option(425, 90 + _cam_middle - ScrollY, text_jerald, optionselected == 3);
draw_option(425, 120 + _cam_middle - ScrollY, text_perfect, optionselected == 4);
draw_option(425, 150 + _cam_middle - ScrollY, text_flashlight, optionselected == 5);
draw_option(425, 180 + _cam_middle - ScrollY, text_collects, optionselected == 6);
draw_option(425, 210 + _cam_middle - ScrollY, text_breakables, optionselected == 7);
draw_option(425, 240 + _cam_middle - ScrollY, text_enemies, optionselected == 8);
draw_option(425, 270 + _cam_middle - ScrollY, text_escapetimer, optionselected == 9);
draw_text(55, _cam_middle, ">")
draw_text(300, _cam_middle, "<")
draw_text(550, _cam_middle, ">")