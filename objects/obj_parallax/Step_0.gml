if (!global.gamePauseState)
	global.ScrollOffset++;
for (var i = 0; i < array_length(layerArray); i++)
{
	if (layerArray[i] != undefined)
	{
		with (layerArray[i])
		{
			x = xstart;
			y = ystart;
			x += xShift;
			y += yShift;
			if (!is_undefined(ds_map_find_value(global.ParallaxMap, id)))
				script_execute_ext(ds_map_find_value(global.ParallaxMap, id).func, ds_map_find_value(global.ParallaxMap, id).args);
			else if (!is_undefined(ds_map_find_value(global.ParallaxMap, layer_get_name(id))))
				script_execute_ext(ds_map_find_value(global.ParallaxMap, layer_get_name(id)).func, ds_map_find_value(global.ParallaxMap, layer_get_name(id)).args);
			if (!global.gamePauseState)
				xShift += hspeed;
			if (!global.gamePauseState)
				yShift += vspeed;
			xprevious = layer_get_x(id);
			yprevious = layer_get_y(id);
			layer_x(id, x);
			layer_y(id, y);
			layer_background_speed(layer_background_get_id(id), !global.gamePauseState ? image_speed : 0);
		}
	}
}
