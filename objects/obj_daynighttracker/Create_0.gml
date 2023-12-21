cyclefx = fx_create("_filter_tintfilter")
fx_set_parameter(cyclefx, "g_TintCol", [0, 0, 0, 1])
cycleeffect = layer_create(-500, "Effect_Cycle")
layer_set_fx(cycleeffect, cyclefx)