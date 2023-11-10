/// @description Apply random layer data
var layers = layer_get_all()
var layerselect = layers[irandom((array_length(layers) - 1))]
var layertype = layer_get_element_type(layerselect)
if layertype == layerelementtype_background
{
	var valchange = irandom(14)
	if valchange == 0
		layer_background_stretch(layerselect, irandom(1))
	else if valchange == 1
		layer_background_speed(layerselect, random_range(-10, 10))
	else if valchange == 2
		layer_background_alpha(layerselect, random(1))
	else if valchange == 3
		layer_background_blend(layerselect, random(c_white))
	else if valchange == 4
	{
		layer_background_htiled(layerselect, irandom(1))
		layer_background_vtiled(layerselect, irandom(1))
	}
	else if valchange == 5
	{
		layer_background_xscale(layerselect, random(10))
		layer_background_yscale(layerselect, random(10))
	}
	else if valchange == 6
	{
		layer_x(layerselect, irandom(room_width))
		layer_y(layerselect, irandom(room_height))
	}
	else if valchange == 7
	{
		layer_hspeed(layerselect, irandom(random(10)))
		layer_vspeed(layerselect, irandom(random(10)))
	}
	else
		layer_change_background(layer_background_get_sprite(layerselect), irandom((array_length(global.spritelist) - 1)))
}
else if layertype == layerelementtype_tilemap
	layer_change_tileset(tileset_get_texture(layerselect), irandom((array_length(global.tilesetlist) - 1)))