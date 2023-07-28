depth = 10;
state = 0;
var i = 0;
hub_array[i++] = [121, "FLOOR 2"];
hub_array[i++] = [66, "FLOOR 1"];
hub_array[i++] = [130, "BASEMENT"];
drawx = 0;
drawy = 0;
surface2 = -4;
yoffset = 0;
ScrollY = 0;
playerID = -4;
selected = 0;
for (var c = 1; c < array_length(hub_array); c++)
{
	if (room == hub_array[c][0])
	{
		selected = c;
		break;
	}
}
image_index = selected;
