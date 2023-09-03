depth = 10;
state = 0;
var i = 0;
hub_array[i++] = [hub_top, "T"];
hub_array[i++] = [hub_w3, "3"];
hub_array[i++] = [hub_w2, "2"];
random_index = irandom_range(0,100);
if random_index = 100
	hub_array[i++] = [hub_w1old, "1"];
else
	hub_array[i++] = [hub_w1, "1"];
hub_array[i++] = [hub_basement, "B"];
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
