var lay_id = layer_get_id("Backgrounds_foreground");
layer_depth(lay_id, -50);
lay_id = layer_get_id("Backgrounds_foregroundLow");
layer_depth(lay_id, -50);
layerNum = 0;
assetNum = 0;
asset_sprites = 0;
layerArray = [];
var a = layer_get_all();
var i = 0;
for (var z = 0; i < array_length(a); i++)
{
	var back_id = layer_background_get_id(a[i]);
	var asset_id = layer_asset_get_id_fixed(a[i]);
	if ((back_id != -1 || asset_id != -1) && layer_get_visible(a[i]))
	{
		layerArray[z++] = 
		{
			id: a[i],
			image_speed: layer_background_get_speed(back_id),
			x: layer_get_x(a[i]),
			y: layer_get_y(a[i]),
			xstart: layer_get_x(a[i]),
			ystart: layer_get_y(a[i]),
			xprevious: layer_get_x(a[i]),
			yprevious: layer_get_y(a[i]),
			hspeed: layer_get_hspeed(a[i]),
			vspeed: layer_get_vspeed(a[i]),
			xShift: global.ScrollOffset * layer_get_hspeed(a[i]),
			yShift: global.ScrollOffset * layer_get_vspeed(a[i])
		};
		if (asset_id != -1)
		{
			var name = layer_get_name(a[i]);
			var vals = [0, 0];
			if (!is_undefined(ds_map_find_value(global.ParallaxMap, name)))
				vals = ds_map_find_value(global.ParallaxMap, name).args;
			var all_assets = layer_get_all_elements(a[i])
			for (var j = 0; j < array_length(all_assets); j++)
			{
				var cur_asset = all_assets[j];
				var _xx = layer_sprite_get_x(cur_asset);
				var _yy = layer_sprite_get_y(cur_asset);
				if (vals[0] != 0)
				{
					var normal_x = _xx - (_xx * vals[0]);
					var cam_x = 480 * vals[0];
					layer_sprite_x(cur_asset, normal_x + cam_x);
				}
				if (vals[1] != 0)
				{
					var normal_y = _yy - (_yy * vals[1]);
					var cam_y = 270 * vals[1];
					layer_sprite_y(cur_asset, normal_y + cam_y);
				}
			}
		}
	}
}
var filt_id = layer_get_id("Effect_1");
layer_depth(filt_id, -200);
scr_parallaxbg_init();
