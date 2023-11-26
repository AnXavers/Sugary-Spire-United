var _lvl = capitalize_section(level, 1, 1)
ini_open("optionData.ini");
ini_write_real(_lvl, "gamemode", global.gamemode);
ini_write_real(_lvl, "leveldesign", global.leveldesign);
ini_write_real(_lvl, "lapmode", global.lapmode);
ini_write_real(_lvl, "jerald", global.jerald);
ini_write_real(_lvl, "perfect", global.perfect);
ini_write_real(_lvl, "flashlight", global.flashlight);
ini_write_real(_lvl, "collects", global.collects);
ini_write_real(_lvl, "breakables", global.breakables);
ini_write_real(_lvl, "enemies", global.enemies);
ini_write_real(_lvl, "escapetimer", global.escapetimer);
ini_close();
