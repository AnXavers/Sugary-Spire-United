idle = spr_janitor2NPC_idle2;
speak = spr_janitor2NPC_idle2;
mytex = spr_lapjanitorbg;
image_speed = 0.35
ini_open(global.fileselect);
laps = ini_read_string("Laps", string("entryway"), 1)
ini_close()
text = "You've lapped Crunchy Construction " + string(laps) + " times!";
if laps <= 1
	instance_destroy()