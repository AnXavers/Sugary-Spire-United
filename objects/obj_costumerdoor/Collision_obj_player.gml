if (other.key_up2 && (!instance_exists(obj_palettechanger)))
{
	with (instance_create((room_width / 2), (room_height / 2), obj_palettechanger))
	{
		global.colorchoosen = 0
		global.oldcolorchoosen = 0
		for (var i = 0; i < obj_player.colorheight; i++)
			color[i] = obj_player.color[i]
		ini_open((((("Custom/" + string(obj_player.charname)) + "_") + string(obj_player.customsavedpalette)) + "_palettes.ini"))
		palettename = ini_read_string("General", "PaletteName", "Palette 1")
		ini_close()
		input = palettename
		i = 0
		repeat (3)
		{
			with (instance_create(x, y, obj_palettechangerscrollbar))
			{
				colorchannel = i
				other.slider[colorchannel] = id
				readcolor = 1
				ini_open((((("Custom/" + string(obj_player.charname)) + "_") + string(obj_player.customsavedpalette)) + "_palettes.ini"))
				switch colorchannel
				{
					case 0:
						colorvalue = (ini_read_real(((string(obj_player.charname) + "Colors") + string(global.colorchoosen)), "Red", 0) / 255)
						break
					case 1:
						colorvalue = (ini_read_real(((string(obj_player.charname) + "Colors") + string(global.colorchoosen)), "Green", 0) / 255)
						break
					case 2:
						colorvalue = (ini_read_real(((string(obj_player.charname) + "Colors") + string(global.colorchoosen)), "Blue", 0) / 255)
						break
				}

				ini_close()
				input = string(round((colorvalue * 255)))
				keyboard_string = string(round((colorvalue * 255)))
			}
			i++
		}
	}
	other.vsp = 20
	other.visible = false
	var _depth = (other.depth - 0.5)
	with (instance_create((other.x + random_range(-5, 5)), (other.y + random_range(-5, 5)), obj_bangeffect))
	{
		depth = _depth
		image_speed = 0.35
		sprite_index = spr_poofeffect
		image_angle = (irandom(3) * 90)
	}
}
