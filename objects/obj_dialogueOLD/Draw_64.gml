draw_set_font(font_dialog);
draw_set_halign(0);
draw_set_color(c_white);
var curMsg = global.dialogmsg[current_message];
var _text = curMsg[0];
var _portrait = curMsg[1];
var hasImage = _portrait != -4;
if (!surface_exists(surface))
	surface = surface_create(760, 100);
else
{
	surface_set_target(surface);
	draw_sprite_tiled(spr_dialogbg, -1, x++, y++);
	surface_reset_target();
	draw_surface(surface, 100, 400 + yoffset);
}
var _textX = 110;
var _textY = 415 + yoffset;
if (hasImage)
{
	draw_sprite_ext(_portrait, -1, 100, 450 + yoffset, 1, 1, 0, c_white, 1);
	_textX = 210;
}
var _wrapX = 760 - _textX - 10;
var _xoffset = 0;
var _yoffset = 0;
for (var i = 0; i < floor(drawchar); i++)
{
	var letter = [string_char_at(_text, i), string_char_at(_text, i + 1), string_char_at(_text, i + 2), string_char_at(_text, i + 3), string_char_at(_text, i + 4), string_char_at(_text, i + 5), string_char_at(_text, i + 6), string_char_at(_text, i + 7), string_char_at(_text, i + 8)];
	var _length = string_width("A") + 1;
	var _height = string_height("A") + 3;
	draw_text(_textX + _xoffset, _textY + _yoffset, letter[1]);
	_xoffset += _length;
	if (letter[2] == "&")
	{
		i++;
		_xoffset = 0;
		_yoffset += _height;
	}
	if (letter[2] == "#" && letter[3] == "n" && letter[4] == "l")
		force_next = true;
	if (letter[2] == "#" && letter[3] == "p" && pause_time <= 0)
	{
		i += 4;
		drawchar++;
		pause_time = real(letter[4] + letter[5]);
	}
	if (letter[1] == " " && _xoffset >= _wrapX)
	{
		_xoffset = 0;
		_yoffset += _height;
	}
}
var textDraw = string_copy(_text, 1, real_drawchar);
