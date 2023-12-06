if room != rm_missing
	room_goto(hub_hallway);
else
{
	instance_create(x, y, obj_fadeout)
	obj_player.state = states.comingoutdoor
}