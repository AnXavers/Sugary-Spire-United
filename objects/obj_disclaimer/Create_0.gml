depth = -1000;
ini_open(global.fileselect);
obj_player.character = ini_read_string("Carryover", "player", "P")
ini_close();
txt = "[fa_center][fa_middle][spr_npcfont][shake][c_red]NOTICE!##[c_white]Nothing seen may be final, and it is all subject to change."
if room == rm_missing
	txt = "[fa_center][fa_middle][spr_npcfont][shake][c_red]MISSING ROOM!##[c_white]Press enter to go to hub."