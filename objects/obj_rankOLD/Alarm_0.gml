scr_hatScript();
scr_levelSet();
global.levelname = "none";
obj_player.targetDoor = "A";
obj_player.targetRoom = hub_w1;
audio_stop_all();
instance_create(x, y, obj_fadeout);
