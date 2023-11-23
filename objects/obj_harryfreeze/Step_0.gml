if (live_call()) return live_result;
x = horigin + random_range(-1, 1)
obj_camera.cam_lzoom = lerp(obj_camera.cam_lzoom, 0.4, 0.2)
global.harryfxval = lerp(global.harryfxval, 0.6, 0.05)
fx_set_parameter(global.harryfx, "g_TintCol", [global.harryfxval, global.harryfxval, global.harryfxval, 1])