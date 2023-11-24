scr_sound(sound_enemythrow)
optionselected = 0;
level = instance_nearest(x, y, obj_startgate).level
ini_open("optionData.ini");
global.leveldesign = ini_read_real(level, "leveldesign", 1);
global.lapmode = ini_read_real(level, "lapmode", 1);
global.jerald = ini_read_real(level, "jerald", 0);
ini_close();
optionsaved_leveldesign = global.leveldesign;
optionsaved_lapmode = global.lapmode;
optionsaved_jerald = global.jerald;
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