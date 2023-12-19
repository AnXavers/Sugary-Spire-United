global.hallucinationfx = fx_create("_filter_large_blur")
fx_set_parameter(global.hallucinationfx, "g_Radius", [2])
global.hallucinationeffect = layer_create(-1000, "Effect_Hallucination")
fx_set_single_layer(global.hallucinationfx, true)
layer_set_fx(global.hallucinationeffect, global.hallucinationfx)
instance_create_layer(x, y, global.hallucinationeffect, obj_hallucination);
instance_destroy();