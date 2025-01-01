depth = -1000;
if instance_exists(obj_player)
	obj_player.state = states.actor
ini_open(global.fileselect);
obj_player.character = ini_read_string("Carryover", "player", "P")
ini_close();
txt = "[fa_center][fa_middle][spr_npcfont][shake][c_red]NOTICE!##[c_white]SSU is a cancelled project and I have moved on from it. #Please go follow PTU's development instead."
if room == rm_missing
{
	txt = "[fa_center][fa_middle][spr_npcfont][shake][c_red]MISSING ROOM!##[c_white]Press enter to go to hub."
	obj_player.targetDoor = "A"
	obj_player.targetRoom = hub_hallway
}
if room == hub_hallway
{
	txt = "[fa_center][fa_middle][spr_npcfont][shake][c_red]Notice!##[c_white]SSU has no relation to the SS team, it is a mod that is built off of a leaked build without express permission.##Nothing in footage seen may be final, and it is all subject to change."
	obj_player.targetDoor = "A"
	obj_player.targetRoom = hub_hallway
}