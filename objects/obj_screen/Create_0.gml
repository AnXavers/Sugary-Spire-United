application_surface_draw_enable(false);
finalApplicationSurface = -4;
finalApplicationSurfBuffer = -1;
nextPowTwo = function()
{
	return power(2, ceil(log2(argument0) / log2(2)));
};
var surfW = 960;
var surfH = 540;
var wScalar = nextPowTwo(surfW);
var hScalar = nextPowTwo(surfH);
uRes = shader_get_uniform(6, "uRes");
sRes = [wScalar, hScalar];
