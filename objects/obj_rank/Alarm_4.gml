scr_hatScript();
scr_levelSet();
global.levelname = "none";
obj_player.targetRoom = global.entergateroom;
obj_player.targetDoor = global.entergatedoor;
global.exitgatetaunt = 0
audio_stop_all();
instance_create(x, y, obj_fadeout);
alarm[0] = -1;
alarm[1] = -1;
alarm[2] = -1;
alarm[3] = -1;
alarm[5] = -1;
