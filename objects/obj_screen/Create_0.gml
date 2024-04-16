application_surface_draw_enable(false);
finalApplicationSurface = -4;
finalApplicationSurfBuffer = -1;
nextPowTwo = function()
{
	return power(2, ceil(log2(argument0) / log2(2)));
};
var wScalar = nextPowTwo(global.cam_w);
var hScalar = nextPowTwo(global.cam_h);
uRes = shader_get_uniform(shd_pixelscale, "uRes");
sRes = [wScalar, hScalar];
