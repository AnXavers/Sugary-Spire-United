function scr_destroy_tile(argument0)
{
	var lay_id = layer_get_id(argument0);
	var map_id = layer_tilemap_get_id(lay_id);
	for (var i = 0; i < floor(sprite_width / tilemap_get_tile_width(map_id)); i++)
	{
		for (var z = 0; z < floor(sprite_height / tilemap_get_tile_height(map_id)); z++)
		{
			var data = tilemap_get_at_pixel(map_id, x + (i * tilemap_get_tile_width(map_id)) + 1, y + (z * tilemap_get_tile_height(map_id)) + 1);
			data = tile_set_empty(data);
			tilemap_set_at_pixel(map_id, data, x + (i * tilemap_get_tile_width(map_id)) + 1, y + (z * tilemap_get_tile_height(map_id)) + 1);
		}
	}
}
function scr_destroy_nearby_tiles()
{
	instance_destroy(instance_place(x + 1, y, obj_tiledestroy));
	instance_destroy(instance_place(x - 1, y, obj_tiledestroy));
	instance_destroy(instance_place(x, y + 1, obj_tiledestroy));
	instance_destroy(instance_place(x, y - 1, obj_tiledestroy));
}
