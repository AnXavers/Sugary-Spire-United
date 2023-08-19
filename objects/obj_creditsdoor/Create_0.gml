DoorUnlock = false;
ini_open(global.fileselect);
var entrywayrank = ini_read_string("Ranks", "entryway", "none");
var cottonrank = ini_read_string("Ranks", "steamy", "none");
var moleassrank = ini_read_string("Ranks", "molasses", "none");
var minesrank = ini_read_string("Ranks", "mines", "none");
ini_close();
DoorUnlock = entrywayrank != "none" && cottonrank != "none" && moleassrank != "none" && minesrank != "none";
event_inherited();
if (!DoorUnlock)
{
	with (instance_create(x, y, obj_doorblocked))
		visible = false;
}
