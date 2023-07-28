var _cam_x = camera_get_view_x(view_camera[0]);
var _cam_y = camera_get_view_y(view_camera[0]);
var _mouse_x = mouse_x - _cam_x;
var _mouse_y = mouse_y - _cam_y;
stop = false;
var _stop = false;
with (obj_palettechangerscrollbar)
{
	if (selected == 1 || input_text == 1)
		_stop = true;
}
if (input_text == 1 || _stop == 1)
	stop = true;
if (player.key_right2 && stop == 0)
{
	ini_open("Custom/" + string(player.characters) + "_" + string(player.customsavedpalette) + "_palettes.ini");
	ini_write_real(string(player.characters) + "Colors" + string(global.colorchoosen), "Red", slider[0].finalvalue);
	ini_write_real(string(player.characters) + "Colors" + string(global.colorchoosen), "Green", slider[1].finalvalue);
	ini_write_real(string(player.characters) + "Colors" + string(global.colorchoosen), "Blue", slider[2].finalvalue);
	ini_close();
	player.customsavedpalette = clamp(player.customsavedpalette + 1, 1, 5);
	with (player)
	{
		scr_playercolors();
		customupdate = true;
	}
	ini_open("Custom/" + string(player.characters) + "_" + string(player.customsavedpalette) + "_palettes.ini");
	palettename = ini_read_string("General", "PaletteName", "Palette 1");
	ini_close();
	input = palettename;
	global.oldcolorchoosen = 0;
	global.colorchoosen = 0;
	with (obj_palettechangerscrollbar)
		readcolor = true;
	for (var i = 0; i < player.colorheight; i++)
		color[i] = player.color[i];
}
if (-player.key_left2 && stop == 0)
{
	ini_open("Custom/" + string(player.characters) + "_" + string(player.customsavedpalette) + "_palettes.ini");
	ini_write_real(string(player.characters) + "Colors" + string(global.colorchoosen), "Red", slider[0].finalvalue);
	ini_write_real(string(player.characters) + "Colors" + string(global.colorchoosen), "Green", slider[1].finalvalue);
	ini_write_real(string(player.characters) + "Colors" + string(global.colorchoosen), "Blue", slider[2].finalvalue);
	ini_close();
	player.customsavedpalette = clamp(player.customsavedpalette - 1, 1, 5);
	with (player)
	{
		scr_playercolors();
		customupdate = true;
	}
	ini_open("Custom/" + string(player.characters) + "_" + string(player.customsavedpalette) + "_palettes.ini");
	palettename = ini_read_string("General", "PaletteName", "Palette 1");
	ini_close();
	input = palettename;
	global.oldcolorchoosen = 0;
	global.colorchoosen = 0;
	with (obj_palettechangerscrollbar)
		readcolor = true;
	for (i = 0; i < player.colorheight; i++)
		color[i] = player.color[i];
}
if (global.colorchoosen != global.oldcolorchoosen)
{
	ini_open("Custom/" + string(player.characters) + "_" + string(player.customsavedpalette) + "_palettes.ini");
	ini_write_real(string(player.characters) + "Colors" + string(global.colorchoosen), "Red", slider[0].finalvalue);
	ini_write_real(string(player.characters) + "Colors" + string(global.colorchoosen), "Green", slider[1].finalvalue);
	ini_write_real(string(player.characters) + "Colors" + string(global.colorchoosen), "Blue", slider[2].finalvalue);
	ini_close();
	global.colorchoosen = clamp(global.oldcolorchoosen, 0, player.colorheight - 1);
	with (obj_palettechangerscrollbar)
		readcolor = true;
}
if (global.colorchoosen == global.oldcolorchoosen)
	color[global.colorchoosen] = make_color_rgb(slider[0].finalvalue, slider[1].finalvalue, slider[2].finalvalue);
if (player.key_down2 && stop == 0)
	global.oldcolorchoosen = clamp(global.colorchoosen + 1, 0, player.colorheight - 1);
else if (player.key_up2 && stop == 0)
	global.oldcolorchoosen = clamp(global.colorchoosen - 1, 0, player.colorheight - 1);
if ((player.key_slap2 || keyboard_check_pressed(vk_enter)) && stop == 0 && has_selectedoption <= 0)
{
	ini_open("Custom/" + string(player.characters) + "_" + string(player.customsavedpalette) + "_palettes.ini");
	ini_write_real(string(player.characters) + "Colors" + string(global.colorchoosen), "Red", slider[0].finalvalue);
	ini_write_real(string(player.characters) + "Colors" + string(global.colorchoosen), "Green", slider[1].finalvalue);
	ini_write_real(string(player.characters) + "Colors" + string(global.colorchoosen), "Blue", slider[2].finalvalue);
	ini_close();
	with (player)
	{
		scr_playercolors();
		state = 62;
		sprite_index = spr_walkfront;
		image_index = 0;
		blackblend = 0;
		image_blend = make_colour_hsv(0, 0, 0);
		visible = true;
		xscale = -1;
		customupdate = true;
	}
	instance_destroy();
}
if (mouse_check_button_pressed(1) && input_text == 0 && stop == 0)
{
	if (point_in_rectangle(_mouse_x, _mouse_y, ExportButton.xpos - 28, ExportButton.ypos - 25, ExportButton.xpos + 28, ExportButton.ypos + 28))
	{
		ExportButton.activated = true;
		ExportButton.buffertimer = 10;
		if (ExportButton.activated)
			event_user(0);
	}
}
if (mouse_check_button_pressed(1) && input_text == 0 && stop == 0)
{
	if (point_in_rectangle(_mouse_x, _mouse_y, ImportButton.xpos - 28, ImportButton.ypos - 25, ImportButton.xpos + 28, ImportButton.ypos + 28))
	{
		ImportButton.activated = true;
		ImportButton.buffertimer = 10;
		if (ImportButton.activated)
			event_user(1);
	}
}
if (mouse_check_button_pressed(1) && input_text == 0 && stop == 0)
{
	if (point_in_rectangle(_mouse_x, _mouse_y, 333, yi - 43, 627, yi + 43) && yi <= 500)
	{
		input_text = true;
		keyboard_string = "";
		input = palettename;
	}
}
if (((player.key_jump2 || keyboard_check_pressed(vk_enter)) || player.key_slap2) && input_text == 1)
{
	input_text = false;
	if (player.key_jump2 || keyboard_check_pressed(vk_enter))
	{
		palettename = string(input);
		ini_open("Custom/" + string(player.characters) + "_" + string(player.customsavedpalette) + "_palettes.ini");
		ini_write_string("General", "PaletteName", string(palettename));
		ini_close();
	}
	else
		input = palettename;
}
if (input_text == 1)
{
	if (keyboard_check(vk_anykey) && inputbuffer == 0)
	{
		input += keyboard_string;
		keyboard_string = "";
		inputbuffer = inputmax;
	}
	if (keyboard_check(vk_backspace) && deletebuffer == 0)
	{
		input = string_delete(input, string_length(input), 1);
		deletebuffer = deletemax;
	}
}
yi = approach(yi, 500, 5);
if (showtext == 1)
{
	if (choosen == 0)
	{
		_message = store_message[_messageindex];
		if (_messageindex < (array_length(store_message) - 1))
			_messageindex += 1;
		else
			_messageindex = 0;
		choosen = true;
	}
	if (_draw_y < 35)
		_draw_y += 5;
	else
		_draw_y = 35;
}
if (showtext == 0)
{
	if (_draw_y > -64)
		_draw_y -= 1;
	else
	{
		_message = "";
		_draw_y = -64;
	}
}
var _sprite = obj_tv.idletvspr;
if (floor(image_idnex) >= (sprite_get_number(_sprite) - 1))
	image_idnex = 0;
else
	image_idnex += 0.35;
