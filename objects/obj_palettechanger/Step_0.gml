obj_player.vsp = 0
obj_player.hsp = 0
obj_player.sprite_index = spr_pizzelle_idle
obj_player.state = states.actor
var _cam_x = camera_get_view_x(view_camera[0])
var _cam_y = camera_get_view_y(view_camera[0])
var _mouse_x = (mouse_x - _cam_x)
var _mouse_y = (mouse_y - _cam_y)
stop = 0
var _stop = 0
with (obj_palettechangerscrollbar)
{
	if (selected == 1 || input_text == 1)
		_stop = 1
}
if (input_text == 1 || _stop == 1)
	stop = 1
if (obj_player.key_right2 && stop == 0)
{
	ini_open((((("Custom/" + string(obj_player.charname)) + "_") + string(obj_player.customsavedpalette)) + "_palettes.ini"))
	ini_write_real(((string(obj_player.charname) + "Colors") + string(global.colorchoosen)), "Red", slider[0].finalvalue)
	ini_write_real(((string(obj_player.charname) + "Colors") + string(global.colorchoosen)), "Green", slider[1].finalvalue)
	ini_write_real(((string(obj_player.charname) + "Colors") + string(global.colorchoosen)), "Blue", slider[2].finalvalue)
	ini_close()
	obj_player.customsavedpalette = clamp((obj_player.customsavedpalette + 1), 1, 5)
	with obj_player
		scr_playercolors()
	ini_open((((("Custom/" + string(obj_player.charname)) + "_") + string(obj_player.customsavedpalette)) + "_palettes.ini"))
	palettename = ini_read_string("General", "PaletteName", "Palette 1")
	ini_close()
	input = palettename
	global.oldcolorchoosen = 0
	global.colorchoosen = 0
	with (obj_palettechangerscrollbar)
		readcolor = 1
	for (var i = 0; i < obj_player.colorheight; i++)
		color[i] = obj_player.color[i]
}
if ((-obj_player.key_left2) && stop == 0)
{
	ini_open((((("Custom/" + string(obj_player.charname)) + "_") + string(obj_player.customsavedpalette)) + "_palettes.ini"))
	ini_write_real(((string(obj_player.charname) + "Colors") + string(global.colorchoosen)), "Red", slider[0].finalvalue)
	ini_write_real(((string(obj_player.charname) + "Colors") + string(global.colorchoosen)), "Green", slider[1].finalvalue)
	ini_write_real(((string(obj_player.charname) + "Colors") + string(global.colorchoosen)), "Blue", slider[2].finalvalue)
	ini_close()
	obj_player.customsavedpalette = clamp((obj_player.customsavedpalette - 1), 1, 5)
	with (obj_player)
		scr_playercolors()
	ini_open((((("Custom/" + string(obj_player.charname)) + "_") + string(obj_player.customsavedpalette)) + "_palettes.ini"))
	palettename = ini_read_string("General", "PaletteName", "Palette 1")
	ini_close()
	input = palettename
	global.oldcolorchoosen = 0
	global.colorchoosen = 0
	with (obj_palettechangerscrollbar)
		readcolor = 1
	for (i = 0; i < obj_player.colorheight; i++)
		color[i] = obj_player.color[i]
}
if (global.colorchoosen != global.oldcolorchoosen)
{
	ini_open((((("Custom/" + string(obj_player.charname)) + "_") + string(obj_player.customsavedpalette)) + "_palettes.ini"))
	ini_write_real(((string(obj_player.charname) + "Colors") + string(global.colorchoosen)), "Red", slider[0].finalvalue)
	ini_write_real(((string(obj_player.charname) + "Colors") + string(global.colorchoosen)), "Green", slider[1].finalvalue)
	ini_write_real(((string(obj_player.charname) + "Colors") + string(global.colorchoosen)), "Blue", slider[2].finalvalue)
	ini_close()
	global.colorchoosen = clamp(global.oldcolorchoosen, 0, (obj_player.colorheight - 1))
	with (obj_palettechangerscrollbar)
		readcolor = 1
}
if (global.colorchoosen == global.oldcolorchoosen)
	color[global.colorchoosen] = make_color_rgb(slider[0].finalvalue, slider[1].finalvalue, slider[2].finalvalue)
if (obj_player.key_down2 && stop == 0)
	global.oldcolorchoosen = clamp((global.colorchoosen + 1), 0, (obj_player.colorheight - 1))
else if (obj_player.key_up2 && stop == 0)
	global.oldcolorchoosen = clamp((global.colorchoosen - 1), 0, (obj_player.colorheight - 1))
if ((obj_player.key_attack2 || keyboard_check_pressed(vk_return)) && stop == 0 && has_selectedoption <= 0)
{
	ini_open((((("Custom/" + string(obj_player.charname)) + "_") + string(obj_player.customsavedpalette)) + "_palettes.ini"))
	ini_write_real(((string(obj_player.charname) + "Colors") + string(global.colorchoosen)), "Red", slider[0].finalvalue)
	ini_write_real(((string(obj_player.charname) + "Colors") + string(global.colorchoosen)), "Green", slider[1].finalvalue)
	ini_write_real(((string(obj_player.charname) + "Colors") + string(global.colorchoosen)), "Blue", slider[2].finalvalue)
	ini_close()
	with (obj_player)
	{
		scr_playercolors()
		sprite_index = spr_walkfront
		image_index = 0
		visible = true
		xscale = -1
		array_delete(my_palettes, (array_length(my_palettes) - 1), 10)
		ini_open((((("Custom/" + string(charname)) + "_") + string(customsavedpalette)) + "_palettes.ini"))
		var i = 0
		for (var i = 0; i <= 10 ; i++)
			global.custompal_col[i] = (65536 * ini_read_real(((string(charname) + "Colors") + string(i)), "Blue", 0) + (256 * ini_read_real(((string(charname) + "Colors") + string(i)), "Green", 0) + ini_read_real(((string(charname) + "Colors") + string(i)), "Red", 0)))
		ini_close()
		new_palette("Custom", 0, global.custompal_col[1], global.custompal_col[9], global.custompal_col[3], global.custompal_col[4], global.custompal_col[7], global.custompal_col[8], global.custompal_col[0], global.custompal_col[2]);
		state = (62 << 0)
	}
	instance_destroy()
}
if (mouse_check_button_pressed(mb_left) && input_text == 0 && stop == 0)
{
	if point_in_rectangle(_mouse_x, _mouse_y, (ExportButton.xpos - 28), (ExportButton.ypos - 25), (ExportButton.xpos + 28), (ExportButton.ypos + 28))
	{
		ExportButton.activated = 1
		ExportButton.buffertimer = 10
		if ExportButton.activated
			event_user(0)
	}
}
if (mouse_check_button_pressed(mb_left) && input_text == 0 && stop == 0)
{
	if point_in_rectangle(_mouse_x, _mouse_y, (ImportButton.xpos - 28), (ImportButton.ypos - 25), (ImportButton.xpos + 28), (ImportButton.ypos + 28))
	{
		ImportButton.activated = 1
		ImportButton.buffertimer = 10
		if ImportButton.activated
			event_user(1)
	}
}
if (mouse_check_button_pressed(mb_left) && input_text == 0 && stop == 0)
{
	if (point_in_rectangle(_mouse_x, _mouse_y, 333, (yi - 43), 627, (yi + 43)) && yi <= 500)
	{
		input_text = 1
		keyboard_string = ""
		input = palettename
	}
}
if ((obj_player.key_jump2 || keyboard_check_pressed(vk_return) || obj_player.key_attack2) && input_text == 1)
{
	input_text = 0
	if (obj_player.key_jump2 || keyboard_check_pressed(vk_return))
	{
		palettename = string(input)
		ini_open((((("Custom/" + string(obj_player.charname)) + "_") + string(obj_player.customsavedpalette)) + "_palettes.ini"))
		ini_write_string("General", "PaletteName", string(palettename))
		ini_close()
	}
	else
		input = palettename
}
if (input_text == 1)
{
	if (keyboard_check(vk_anykey) && inputbuffer == 0)
	{
		input += keyboard_string
		keyboard_string = ""
		inputbuffer = inputmax
	}
	if (keyboard_check(vk_backspace) && deletebuffer == 0)
	{
		input = string_delete(input, string_length(input), 1)
		deletebuffer = deletemax
	}
}
yi = approach(yi, 500, 5)
if (showtext == 1)
{
	if (choosen == 0)
	{
		_message = store_message[_messageindex]
		if (_messageindex < (array_length(store_message) - 1))
			_messageindex++
		else
			_messageindex = 0
		choosen = 1
	}
	if (_draw_y < 35)
		_draw_y += 5
	else
		_draw_y = 35
}
if (showtext == 0)
{
	if (_draw_y > -64)
		_draw_y--
	else
	{
		_message = ""
		_draw_y = -64
	}
}
var _sprite = obj_tv.idletvspr
if (floor(image_idnex) >= (sprite_get_number(_sprite) - 1))
	image_idnex = 0
else
	image_idnex += 0.35
