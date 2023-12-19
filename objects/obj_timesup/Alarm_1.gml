if (global.checkpoints && global.lapcount >= 2)
{
	obj_player.targetRoom = global.checkpointroom
	obj_player.targetDoor = global.checkpointdoor
	global.panic = true;
	global.combolost = global.checkpointcombolost
	global.hurtcounter = global.checkpointhurtcounter
	ds_list_clear(global.saveroom)
	ds_list_clear(global.escaperoom)
	ds_list_clear(global.baddieroom)
	ds_list_copy(global.saveroom, global.checkpointsaveroom)
	ds_list_copy(global.baddieroom, global.checkpointbaddieroom)
	instance_create(x, y, obj_fadeout)
	checkpointactive = true
}
else
{
	targetRoom = global.entergateroom;
	global.levelname = "none";
	room_goto(global.entergateroom);
	scr_levelSet();
}