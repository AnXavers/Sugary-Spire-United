depth = 10;
state = 0;
var i = 0;
hub_array[i++] = [tower_5, "FLOOR 5"];
hub_array[i++] = [tower_4, "FLOOR 4"];
hub_array[i++] = [tower_3, "FLOOR 3"];
hub_array[i++] = [tower_2, "FLOOR 2"];
hub_array[i++] = [tower_1, "FLOOR 1"];
hub_array[i++] = [inbetweencutscene, "TO SPIRE"];
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
