var timecycle = ((global.realtime / 86400) * (pi * 2))
var dayxtimecycle = ((sin(timecycle) + 1) * 375)
var dayytimecycle = (((cos(timecycle) + 1) * 200) - 10)
var nightxtimecycle = ((sin(timecycle - pi) + 1) * 375)
var nightytimecycle = (((cos(timecycle - pi) + 1) * 200) - 10)
var tintr = (clamp((nightytimecycle - 30), 133, 255) / 256)
var tintg = (clamp((nightytimecycle - 70), 141, 255) / 256)
var tintb = (clamp((nightytimecycle - 130), 211, 255) / 256)
fx_set_parameter(cyclefx, "g_TintCol", [tintr, tintg, tintb, 1])
var layer_idday = layer_get_id(assignedlayers[0])
var layer_idnight = layer_get_id(assignedlayers[1])
layer_x(layer_idday, dayxtimecycle + obj_camera.Cam_x)
layer_y(layer_idday, dayytimecycle + obj_camera.Cam_y)
layer_x(layer_idnight, nightxtimecycle + obj_camera.Cam_x)
layer_y(layer_idnight, nightytimecycle + obj_camera.Cam_y)