var layer_id = layer_get_id(assignedlayer)
if xwaveinfo[0]
	layer_x(layer_id, wave(xwaveinfo[1], xwaveinfo[2], xwaveinfo[3], xwaveinfo[4], current_time + xwaveinfo[5]))
if ywaveinfo[1]
	layer_y(layer_id, wave(ywaveinfo[1], ywaveinfo[2], ywaveinfo[3], ywaveinfo[4], current_time + ywaveinfo[5]))