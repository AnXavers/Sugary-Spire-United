var surfW = 960;
var surfH = 540;
if (!surface_exists(finalApplicationSurface))
{
	finalApplicationSurface = surface_create(960, 540);
	if (buffer_exists(finalApplicationSurfBuffer))
		buffer_set_surface(finalApplicationSurfBuffer, finalApplicationSurface, 0);
}
var shader = -4;
var appa = 1;
if (!global.gamePauseState)
{
	if (global.panic && global.fill <= 3600)
		shader = 13;
	else
		shader = -4;
	if (global.screenmelt && global.panic)
		appa = lerp(1, 0.5, global.wave / global.maxwave);
}
if (!global.gamePauseState)
{
	surface_set_target(finalApplicationSurface);
	shader_set(14);
	var fade = shader_get_uniform(14, "fade");
	shader_set_uniform_f(fade, global.greyscalefade);
	gpu_set_blendmode_ext(2, 6);
	draw_surface_stretched_ext(application_surface, 0, 0, 960, 540, c_white, appa);
	gpu_set_blendmode(0);
	shader_reset();
	surface_reset_target();
}
if (global.smoothscale)
{
	gpu_set_tex_filter(true);
	shader_set(6);
	shader_set_uniform_f_array(uRes, sRes);
	draw_surface_stretched_ext(finalApplicationSurface, 0, 0, surfW, surfH, c_white, 1);
	shader_reset();
	gpu_set_tex_filter(false);
}
else
	draw_surface_stretched_ext(finalApplicationSurface, 0, 0, surfW, surfH, c_white, 1);
if (!buffer_exists(finalApplicationSurfBuffer))
	finalApplicationSurfBuffer = buffer_create(surfW * surfH * 4, 0, 1);
if (global.gamePauseState)
	buffer_get_surface(finalApplicationSurfBuffer, finalApplicationSurface, 0);
