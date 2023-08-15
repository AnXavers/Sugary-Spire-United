if (x >= 960 && !instance_exists(obj_fadeout))
{
	with (instance_create(x, y, obj_fadeout))
		obj_player.targetRoom = global.totowerspire;
}