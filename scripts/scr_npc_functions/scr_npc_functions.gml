function npc_jerald(argument0 = "entryway", argument1 = "Crunchy Construction"){
	idle = spr_janitor2NPC_idle2;
	speak = spr_janitor2NPC_idle2;
	mytex = spr_lapjanitorbg;
	image_speed = 0.35
	y = (y + 18)
	ini_open(global.fileselect);
	var laps = ini_read_string("Laps", argument0, 1)
	ini_close()
	text = "You've lapped " + argument1 + " " + string(laps) + " times!";
	if (laps <= 1 || global.panic)
		instance_destroy()
}