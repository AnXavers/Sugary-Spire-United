state = 0
var i = 0
w1target = hub_w1
w2target = hub_w2
if random (0.03)
{
	w1target = hub_w1old
	if random (1/3)
		w1target = hub_w1oldold
	else if random (0.5)
		w1target = hub_w1oldoldold
}
if random (0.01)
	w2target = hub_w2old
hub_array[i++] = [hub_top, "THE TOP"]
hub_array[i++] = [hub_w3, "FLOOR 3"]
hub_array[i++] = [w2target, "FLOOR 2"]
hub_array[i++] = [w1target, "FLOOR 1"]
hub_array[i++] = [hub_basement, "THE BASEMENT"]
drawx = 0
drawy = 0
surface2 = -4
yoffset = 0
ScrollY = 0
selected = 0
var c = 1
while (c < array_length(hub_array))
{
    if (room == hub_array[c][0])
    {
        selected = c
        break
    }
    else
    {
        c++
        continue
    }
}
image_index = selected
