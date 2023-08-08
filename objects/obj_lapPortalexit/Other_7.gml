if global.levelname = "entryway"
{
	var _minutes = 1
	var _seconds = 10
}
if global.levelname = "steamy"
{
	var _minutes = 1
	var _seconds = 15
}
if global.levelname = "molasses"
{
	var _minutes = 1
	var _seconds = 35
}
if global.levelname = "mines"
{
	var _minutes = 0
	var _seconds = 00
}
if global.levelname = "fudge"
{
	var _minutes = 2
	var _seconds = 10
}
if global.levelname = "dance"
{
	var _minutes = 1
	var _seconds = 30
}
if global.levelname = "estate"
{
	var _minutes = 2
	var _seconds = 15
}
if global.levelname = "bee"
{
	var _minutes = 1
	var _seconds = 30
}
if global.levelname = "sucrose"
{
	var _minutes = 0
	var _seconds = 0
}
if global.levelname = "martian"
{
	var _minutes = 2
	var _seconds = 00
}
if (global.lapcount >= 2)
{
	global.lapfill = ((_minutes * 60) + _seconds) * 60;
	global.fill += global.lapfill
	if (!instance_exists(obj_panicchanger))
		instance_create(x, y, obj_panicchanger);
}
instance_destroy();