scr_hatScript();
scr_levelSet();
global.levelname = "none";
obj_player.targetRoom = global.entergateroom;
audio_stop_all();
instance_create(x, y, obj_fadeout);
