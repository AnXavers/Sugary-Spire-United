/// @description Apply random layer data
var layers = layer_get_all()
var layerselect = layers[irandom((array_length(layers) - 1))]
var layerID = layer_get_id(layerselect)
var layerelems = layer_get_all_elements(layerID)
for (var i = 0; i < array_length(layerelems); i++)
{
	var layertype = layer_get_element_type(layerelems[i])
	switch layertype
	{
		case layerelementtype_background:
			var valchange = irandom(14)
			switch valchange
			{
				case 0:
					layer_background_stretch(layerelems[i], irandom(1))
					break;
				case 1:
					layer_background_speed(layerelems[i], random_range(-10, 10))
					break;
				case 2:
					layer_background_alpha(layerelems[i], random(1))
					break;
				case 3:
					layer_background_blend(layerelems[i], random(c_white))
					break;
				case 4:
					layer_background_htiled(layerelems[i], irandom(1))
					layer_background_vtiled(layerelems[i], irandom(1))
					break;
				case 5:
					layer_background_xscale(layerelems[i], random(10))
					layer_background_yscale(layerelems[i], random(10))
					break;
				case 6:
					layer_x(layerelems[i], irandom(room_width))
					layer_y(layerelems[i], irandom(room_height))
					break;
				case 7:
					layer_hspeed(layerelems[i], irandom(random(10)))
					layer_vspeed(layerelems[i], irandom(random(10)))
					break;
				default:
					layer_change_background(layer_background_get_sprite(layerelems[i]), irandom((array_length(global.spritelist) - 1)))
					break;
			}
			break;
		case layerelementtype_tilemap:
			layer_change_tileset(tileset_get_texture(layerelems[i]), irandom((array_length(global.tilesetlist) - 1)))
			break;
	}
}