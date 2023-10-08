depth = -1000;
ini_open(global.fileselect);
obj_player.character = ini_read_string("Carryover", "player", "P")
ini_close();