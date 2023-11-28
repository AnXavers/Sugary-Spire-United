if (!global.checkpoints && global.lapcount < 2)
{
	targetRoom = global.entergateroom;
	global.levelname = "none";
	room_goto(global.entergateroom);
	scr_levelSet();
}
else
{
	obj_player.targetRoom = global.checkpointroom
	obj_player.targetDoor = global.checkpointdoor
	instance_create(x, y, obj_fadeout)
	cutscene_create([cutscene_lapPortal_end])
}