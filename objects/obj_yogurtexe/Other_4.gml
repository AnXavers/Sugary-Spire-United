if (room == rank_room || room == timesuproom)
{
	global.l4str = ""
	instance_destroy()
}
x = round((room_width / 2))
y = -40
if (aggro == 1)
{
	aggro = 0
	dist = -1
}
