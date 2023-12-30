var _x = xwaveinfo[0] ? wave(xwaveinfo[1], xwaveinfo[2], xwaveinfo[3], xwaveinfo[4], current_time + xwaveinfo[5]) : 0;
var _y = ywaveinfo[0] ? wave(ywaveinfo[1], ywaveinfo[2], ywaveinfo[3], ywaveinfo[4], current_time + ywaveinfo[5]) : 0;
for (var i = 0; i < array_length(assignedobjects); i++)
{
	if !instance_exists(assignedobjects[i])
	{
		array_delete(assignedobjects, i, 1)
		array_delete(objectorigins, i, 1)
	}
	assignedobjects[i].x = objectorigins[i][0] + _x
	assignedobjects[i].y = objectorigins[i][1] + _y
}