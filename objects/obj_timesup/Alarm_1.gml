if !global.checkpoints
{
	targetRoom = global.entergateroom;
	global.levelname = "none";
	room_goto(global.entergateroom);
	scr_levelSet();
}
else
{
	targetRoom = global.checkpointroom
	targetDoor = global.checkpointdoor
	cutscene_create([cutscene_lapPortal_middle, cutscene_lapPortal_end])
}