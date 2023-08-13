depth = 10;
state = 0;
var i = 0;
hub_array[i++] = [hub_top, "TOP"];
hub_array[i++] = [hub_w3, "FLOOR 3"];
hub_array[i++] = [hub_w2, "FLOOR 2"];
random_index = irandom_range(0,100);
if random_index = 100
	hub_array[i++] = [hub_w1old, "FLOOR 1?"];
else
	hub_array[i++] = [hub_w1, "FLOOR 1"];
hub_array[i++] = [hub_basement, "BASEMENT"];
hub_array[i++] = [inbetweencutscene, "TO TOWER"];
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
