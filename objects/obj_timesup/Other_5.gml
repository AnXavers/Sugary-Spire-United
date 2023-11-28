if (global.checkpoints && global.lapcount >= 2)
{
	global.combo = global.checkpointcombo
	global.collect = global.checkpointcollect
	global.fill = global.checkpointfill
	obj_camera.alarm[3] = 1
}