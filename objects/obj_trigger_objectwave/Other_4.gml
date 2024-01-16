for (var i = 0; i < array_length(assignedobjects); i++)
{
	if (!instance_exists(assignedobjects[i]))
		array_delete(assignedobjects, i, 1)
	if i >= array_length(assignedobjects)
		exit;
	objectorigins[i][0] = assignedobjects[i].x
	objectorigins[i][1] = assignedobjects[i].y
}