if (!surface_exists(secretSurface))
{
	secretSurface = surface_create(room_width, room_height);
	surface_set_target(secretSurface);
	draw_clear_alpha(c_white, 0);
	gpu_set_blendmode_ext(bm_one, bm_inv_src_alpha);
	for (var i = 0; i < array_length(layerArray); i++)
	{
		var tilemap = layer_tilemap_get_id_fixed(layerArray[i]);
		draw_tilemap(tilemap, 0, 0);
	}
	gpu_set_blendmode(bm_normal);
	surface_reset_target();
}
else if (surface_exists(secretSurface))
	draw_surface_ext(secretSurface, 0, 0, 1, 1, 0, c_white, secretAlpha);
