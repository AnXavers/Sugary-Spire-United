scr_sound(sound_enemythrow)
optionselected = 0;
sub_optionselected = 0;
level = instance_nearest(x, y, obj_startgate).level
var _lvl = capitalize_section(global.levelname, 1, 1) + "Modifiers"
ini_open("optionData.ini");
global.gamemode = ini_read_real(_lvl, "gamemode", 0);
global.leveldesign = ini_read_real(_lvl, "leveldesign", 1);
global.lapmode = ini_read_real(_lvl, "lapmode", 1);
global.jerald = ini_read_real(_lvl, "jerald", 0);
global.perfect = ini_read_real(_lvl, "perfect", 0);
global.flashlight = ini_read_real(_lvl, "flashlight", 0);
global.collects = ini_read_real(_lvl, "collects", 1);
global.breakables = ini_read_real(_lvl, "breakables", 1);
global.enemies = ini_read_real(_lvl, "enemies", 1);
global.escapetimer = ini_read_real(_lvl, "escapetimer", 0);
ini_close();
optionsaved_gamemode = global.gamemode;
optionsaved_leveldesign = global.leveldesign;
optionsaved_lapmode = global.lapmode;
optionsaved_jerald = global.jerald;
optionsaved_perfect = global.perfect;
optionsaved_flashlight = global.flashlight;
optionsaved_collects = global.collects;
optionsaved_breakables = global.breakables;
optionsaved_enemies = global.enemies;
optionsaved_escapetimer = global.escapetimer;
modifiers = [
["GAMEMODE", ["DEFAULT", "SWEET SHOWDOWN", "MULTI-SHOWDOWN", "TIME TRIAL", "CONE-GAL"]],
["LEVEL DESIGN", ["P-RANK", "DEV STREAM", "DEMO", "SSU"]],
["LAP MODE", ["DEFAULT", "INFINITE", "CHASEDOWN", "NO LAPPING"]],
["JERALD", ["OFF", "ON"]],
["PERFECT", ["OFF", "D-RANK", "C-RANK", "B-RANK", "A-RANK", "S-RANK", "P-RANK", "E-RANK"]],
["FLASHLIGHT", ["OFF", "ON"]],
["COLLECTS", ["OFF", "ON"]],
["DESTROYABLES", ["OFF", "ON"]],
["ENEMIES", ["OFF", "ON"]],
["ESCAPE TIMER", ["DEFAULT", "CONEBALL", "SUCROSE", "YOGURT"]]
]
bgTileX = 0
bgTileY = 0
fadein = 0
modifierfxval = 0
modifierfx = fx_create("_filter_large_blur")
fx_set_parameter(modifierfx, "g_Radius", [modifierfxval])
modifiereffect = layer_create(-1000, "Effect_Modifiers")
layer_set_fx(modifiereffect, modifierfx)
txtalpha = -30
ScrollX = 0
CursorX = 0
ScrollY = 0
CursorY = 0
canmove = false
alarm[0] = 25
scr_sound(sfx_modifiersstart)