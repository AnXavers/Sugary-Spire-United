optionselected = 0;
ini_open("optionData.ini");
global.language = ini_read_real("Settings", "language", 0);
ini_close();
optionsaved_language = global.language;
subtitle = "GO BACK TO MAIN SCREEN";
CursorY = -999;
ScrollY = 0;
depth = -100;
selecting = -1;
obj_Options_Mod_old.CursorY = -999;

canmove = false;
alarm[0] = 1;
