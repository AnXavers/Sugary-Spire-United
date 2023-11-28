if (global.checkpoints && global.lapcount >= 2)
{
	obj_player.targetRoom = global.checkpointroom
	obj_player.targetDoor = global.checkpointdoor
	global.panic = true;
	ds_list_clear(global.saveroom)
	ds_list_copy(global.saveroom, global.checkpointsaveroom)
	instance_create(x, y, obj_fadeout)
}
else
{
	targetRoom = global.entergateroom;
	global.levelname = "none";
	room_goto(global.entergateroom);
	scr_levelSet();
}