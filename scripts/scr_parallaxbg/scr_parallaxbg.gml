global.bgSurfaceBuffer = -1;
function scr_parallaxbg_init()
{
	var layers;
	var layernum = 0;
	var a = layer_get_all();
	for (var i = 0; i < array_length(a); i++)
	{
		var back_id = layer_background_get_id_fixed(layer_get_name(a[i]));
		if (back_id != -1 && !layer_get_depth(a[i]) <= 0 && layer_get_visible(a[i]) == 1)
			layers[layernum++] = a[i];
	}
	if (!layernum)
		exit;
	var _f = function()
	{
		return -(layer_get_depth(argument0) - layer_get_depth(argument1));
	};
	array_sort(layers, _f);
	var bottom_id = layers[0];
	var top_id = layers[layernum - 1];
	with (obj_parallax)
		depth = layer_get_depth(top_id) - 1;
	layer_script_begin(bottom_id, scr_parallaxbg_start);
	layer_script_end(top_id, scr_parallaxbg_end);
}
function scr_parallaxbg_start()
{
	if (!surface_exists(global.parallaxbg_surface))
		global.parallaxbg_surface = surface_create(1088, 668);
	if (event_type == 8 && event_number == 0)
	{
		surface_set_target(global.parallaxbg_surface);
		draw_clear_alpha(0, 0);
		var _cam_x = camera_get_view_x(view_camera[0]);
		var _cam_y = camera_get_view_y(view_camera[0]);
		var a = layer_get_all();
		for (var i = 0; i < array_length(a); i++)
		{
			var back_id = layer_background_get_id_fixed(layer_get_name(a[i]));
			if (back_id != -1 && !layer_get_depth(a[i]) <= 0 && layer_get_visible(a[i]) == 1)
			{
				layer_x(a[i], (layer_get_x(a[i]) - _cam_x) + 64);
				layer_y(a[i], (layer_get_y(a[i]) - _cam_y) + 64);
			}
		}
	}
}
function scr_parallaxbg_end()
{
	if (event_type == 8 && event_number == 0)
	{
		gpu_set_blendenable(false);
		gpu_set_colorwriteenable(0, 0, 0, 1);
		draw_rectangle(-192, -192, 1152, 732, false);
		gpu_set_blendenable(true);
		gpu_set_colorwriteenable(1, 1, 1, 1);
		surface_reset_target();
	}
}
