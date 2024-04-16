if (!surface_exists(finalApplicationSurface))
{
	finalApplicationSurface = surface_create(global.cam_w, global.cam_h);
	if (buffer_exists(finalApplicationSurfBuffer))
		buffer_set_surface(finalApplicationSurfBuffer, finalApplicationSurface, 0);
}
var shader = -4;
var appa = 1;
if (!global.gamePauseState)
{
	if (global.panic && global.fill <= 3600)
		shader = shd_greyscale;
	if (global.screenmelt && global.panic)
		appa = lerp(1, 0.5, global.wave / global.maxwave);
	surface_set_target(finalApplicationSurface);
	shader_set(shd_premulti);
	var fade = shader_get_uniform(shd_premulti, "fade");
	shader_set_uniform_f(fade, global.greyscalefade);
	gpu_set_blendmode_ext(bm_one, bm_inv_src_alpha);
	draw_surface_stretched_ext(application_surface, 0, 0, global.cam_w, global.cam_h, c_white, appa);
	gpu_set_blendmode(bm_normal);
	shader_reset();
	surface_reset_target();
}
if (global.smoothscale)
{
	gpu_set_tex_filter(true);
	shader_set(shd_pixelscale);
	shader_set_uniform_f_array(uRes, sRes);
	draw_surface_stretched_ext(finalApplicationSurface, 0, 0, global.cam_w, global.cam_h, c_white, 1);
	shader_reset();
	gpu_set_tex_filter(false);
}
else
{
	draw_surface_stretched_ext(finalApplicationSurface, 0, 0, global.cam_w, global.cam_h, c_white, 1);
}
if (!buffer_exists(finalApplicationSurfBuffer))
{
	finalApplicationSurfBuffer = buffer_create(global.cam_w * global.cam_h * 4, 0, 1);
}
if (global.gamePauseState)
{
	buffer_get_surface(finalApplicationSurfBuffer, finalApplicationSurface, 0);
}
