if (sprite_index == spr_file3confirm && !instance_exists(obj_fadeout))
{
	global.fileselect = "saveData3.ini"
	obj_player.targetRoom = scootercutsceneidk;
	obj_player.targetDoor = "A";
	instance_create(x, y, obj_fadeout);
}