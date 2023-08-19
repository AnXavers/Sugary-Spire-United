if (sprite_index == spr_file2confirm && !instance_exists(obj_fadeout))
{
	global.fileselect = "saveData2.ini"
	obj_player.targetRoom = scootercutsceneidk;
	obj_player.targetDoor = "A";
	instance_create(x, y, obj_fadeout);
}
