scr_sound(sound_enemythrow)
optionselected = 0;
level = instance_nearest(x, y, obj_startgate).level
ini_open("optionData.ini");
global.gamemode = ini_read_real(level, "gamemode", 0);
global.leveldesign = ini_read_real(level, "leveldesign", 1);
global.lapmode = ini_read_real(level, "lapmode", 1);
global.jerald = ini_read_real(level, "jerald", 0);
global.perfect = ini_read_real(level, "perfect", 0);
global.flashlight = ini_read_real(level, "flashlight", 0);
global.collects = ini_read_real(level, "collects", 1);
global.breakables = ini_read_real(level, "breakables", 1);
global.enemies = ini_read_real(level, "enemies", 1);
global.escapetimer = ini_read_real(level, "escapetimer", 0);
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
bgTileX = 0
bgTileY = 0
fadeinrad = 0
surface = surface_create(global.cam_w, global.cam_h);
txtalpha = -30
ScrollY = 0
CursorY = 0
surface_set_target(surface);
draw_clear_alpha(0, 0);
surface_reset_target();
canmove = false
alarm[0] = 25