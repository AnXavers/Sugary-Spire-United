depth = 10;
state = 0;
var i = 0;
hub_array[i++] = [hub_top, "THE TOP"];
hub_array[i++] = [hub_w3, "FLOOR 3"];
hub_array[i++] = [hub_w2, "FLOOR 2"];
if random(0.01)
	hub_array[i++] = [hub_w1old, "FLOOR 1"];
else
	hub_array[i++] = [hub_w1, "FLOOR 1"];
hub_array[i++] = [hub_basement, "THE BASEMENT"];
drawx = 0;
drawy = 0;
surface2 = -4;
yoffset = 0;
ScrollY = 0;
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
