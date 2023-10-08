if (sprite_index == spr_file3confirm && !instance_exists(obj_fadeout))
{
	global.fileselect = "saveData3.ini"
	obj_player.targetRoom = scootercutsceneidk;
	obj_player.targetDoor = "A";
	ini_open(global.fileselect);
	obj_player.character = ini_read_string("Carryover", "player", "P");
	ini_close();
	instance_create(x, y, obj_fadeout);
}
