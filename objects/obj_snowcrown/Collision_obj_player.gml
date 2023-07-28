scr_sound(sound_toppingot);
obj_tv.message = "YOU GOT A HAT!";
obj_tv.showtext = 1;
obj_tv.alarm[0] = 200;
ini_open("saveData.ini");
ini_write_real("HatsUnlock", "SnowCrown", true);
ini_close();
instance_destroy();
