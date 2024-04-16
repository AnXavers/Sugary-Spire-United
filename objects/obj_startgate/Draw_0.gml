var xLeft = x - sprite_get_xoffset(sprite_index);
var yTop = y - sprite_get_yoffset(sprite_index);
var gate = details[0];
var mask = details[1];
if (!surface_exists(surf))
	surf = surface_create(sprite_width, sprite_height);
else
{
	surface_set_target(surf);
	draw_clear_alpha(0, 0);
	draw_set_color(c_white);
	draw_rectangle(0, 0, sprite_width, sprite_height, false);
	for (var i = array_length(details) - 1; i > 1; i--)
	{
		var _layer = details[i];
		with (_layer)
		{
			if (func != -4)
				func();
			drawx += scroll_x;
			drawy += scroll_y;
			drawIndex += drawImgSpd;
			draw_sprite_tiled_ext(drawSpr, drawIndex, drawx, drawy, drawXscale, drawYscale, drawBlend, drawAlpha);
		}
	}
	draw_set_alpha(fade);
	gpu_set_colorwriteenable(true, true, true, false);
	draw_rectangle(0, 0, sprite_width, sprite_height, false);
	draw_set_alpha(1);
	gpu_set_colorwriteenable(true, true, true, true);
	gpu_set_blendmode(3);
	with (mask)
	{
		if (func != -4)
			func();
		drawx += scroll_x;
		drawy += scroll_y;
		drawIndex += drawImgSpd;
		draw_sprite_tiled_ext(drawSpr, drawIndex, drawx, drawy, drawXscale, drawYscale, drawBlend, drawAlpha);
	}
	gpu_set_blendmode(bm_normal);
	with (gate)
	{
		if (func != -4)
			func();
		drawx += scroll_x;
		drawy += scroll_y;
		drawIndex += drawImgSpd;
		draw_sprite_tiled_ext(drawSpr, drawIndex, drawx, drawy, drawXscale, drawYscale, drawBlend, drawAlpha);
	}
	surface_reset_target();
}
if (surface_exists(surf))
	draw_surface(surf, xLeft, yTop);
if (showtext) && (showinfo)
{
	ini_open(global.fileselect);
	draw_set_font(global.smallfont);
	draw_set_halign(fa_center);
	draw_set_color(c_white);
	var _rank = ini_read_string("Ranks", string(level), 0);
	var _rankspr = spr_null;
	var _cakespr = 0
	switch (_rank)
	{
		case "e":
			_rankspr = obj_player.spr_rankbubble_Eempty;
			_cakespr = 4
			break;
		case "p":
			_rankspr = obj_player.spr_rankbubble_Pfilled;
			_cakespr = 4
			break;
		case "s":
			_rankspr = obj_player.spr_rankbubble_Sfilled;
			_cakespr = 4
			break;
		case "a":
			_rankspr = obj_player.spr_rankbubble_A;
			_cakespr = 3
			break;
		case "b":
			_rankspr = obj_player.spr_rankbubble_B;
			_cakespr = 2
			break;
		case "c":
			_rankspr = obj_player.spr_rankbubble_C;
			_cakespr = 1
			break;
		case "d":
			_rankspr = obj_player.spr_rankbubble_D;
			_cakespr = 0
			break;
		default:
			_rankspr = spr_null;
			_cakespr = 0
			break;
	}
	var _lrank = ini_read_string("LRank", string(level), 0)
	if (_lrank > 0)
	{
		draw_sprite_ext(_rankspr, 0, (x - 72), (y - 218), 1, 1, 0, c_white, 1)
		draw_sprite_ext(spr_lapsticker, (_lrank - 1), (x + 8), (y - 218), 1, 1, 0, c_white, 1)
		if (_rank == "e")
		{
			draw_set_font(global.erankfont);
			draw_set_halign(fa_center);
			draw_text(x - 55, y - 216, string_repeat("E", (ini_read_string("ERankLength", string(level), 1))))
		}
	}
	else
	{
		draw_sprite_ext(_rankspr, 0, (x - 32), (y - 218), 1, 1, 0, c_white, 1)
		if (_rank == "e")
		{
			draw_set_font(global.erankfont);
			draw_set_halign(fa_center);
			draw_text(x - 5, y - 216, string_repeat("E", (ini_read_string("ERankLength", string(level), 1))))
		}
	}
	draw_sprite(obj_player.spr_gatehud, _cakespr, x, y - 250);
	i = 0;
	collected = "-1";
	_string = ini_read_string("Highscore", string(level), 0)
	_string_length = string_length(_string);
	var pal = colors[i];
	draw_set_font(obj_player.font_collect);
	if global.newscorefont
		draw_set_font(obj_player.font_collect_new);
	draw_set_alpha(1);
	for (i = 0; i < _string_length; i++)
	{
		_xx = (pshake ? irandom_range(-4, 4) : 0) + (-(string_width(_string) / 2) + ((string_width(_string) / _string_length) * i));
		var _yy = (pshake ? irandom_range(-4, 4) : 0);
		pal = colors[i];
		_yyoffset = ((i % 2) == 0) ? -4 : 0;
		pal_swap_set(spr_palcandle, pal, false);
		draw_text(x + _xx + 20, y + _yy + _yyoffset - 320, string_char_at(_string, i + 1));
		shader_reset();
		ini_close();
	}
}