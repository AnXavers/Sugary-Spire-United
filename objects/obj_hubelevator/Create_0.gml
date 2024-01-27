state = 0
var w1target = hub_w1
var w2target = hub_w2
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
hub_array[0][0] = [room, "HELP"]
hub_array[1][0] = [tower_1, "THE TOWER"]
hub_array[2][0] = [hub_top, "THE TOP"]
hub_array[0][1] = [w1target, "FLOOR 1"]
hub_array[1][1] = [w2target, "FLOOR 2"]
hub_array[2][1] = [hub_w3, "FLOOR 3"]
hub_array[0][2] = [hub_basement, "THE BASEMENT"]
hub_array[1][2] = [options_room, "THE CONFECTIONARY"]
hub_array[2][2] = [rm_ssudev, "THE DEVROOM"]
surf = surface_create(160, 256)
drawx = 0
drawy = 0
surface2 = -4
yoffset = 0
selectedx = 0
selectedy = 0
buttonalpha = 1
surfscale = (-pi / 2)
exitinginfo = 0
textalpha = 0
