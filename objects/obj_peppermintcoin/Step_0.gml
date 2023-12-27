scr_collision();
if stuckfix == 0
{
	grace = 20
	x = obj_player.x
	y = obj_player.y
	stuckfix = 5
}
if (place_meeting_solid(x + sign(xscale), y, obj_solid) && (!place_meeting_slope(x + sign(xscale), y + 1)) || (place_meeting(x + sign(xscale), y, obj_destructibles) || place_meeting(x + sign(xscale), y, obj_chocofrog)) || place_meeting_solid(x + sign(xscale), y, obj_hallway))
{
	xscale = -xscale
	stuckfix--
}
else
	stuckfix = 5
hsp = movespeed * xscale
grace--