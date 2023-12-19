/// @description Apply random layer data
var layers = layer_get_all()
var layerselect = layers[irandom((array_length(layers) - 1))]
var layerelems = layer_get_all_elements(layerselect)
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
					var ransprite = irandom((array_length(global.spritelist) - 1))
					var nineslicesprite = sprite_get_nineslice(ransprite)
					if nineslicesprite.enabled = false
						layer_change_background(layer_background_get_sprite(layerelems[i]), ransprite)
					break;
			}
			break;
		case layerelementtype_tilemap:
			var valchange = irandom(3)
			var tileset = tilemap_get_tileset(layerelems[i])
			var tileinfo = tileset_get_info(tileset)
			switch valchange
			{
				case 0:
					layer_change_tileset(tileset, irandom((array_length(global.tilesetlist) - 1)))
				default:
					repeat 100
						tilemap_set(layerelems[i], (irandom(tileinfo.tile_count) - 1), irandom(floor(room_width / 32)), irandom(floor(room_height / 32)))
			}
			break;
	}
}