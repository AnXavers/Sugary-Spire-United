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
	gpu_set_blendmode(0);
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
if (showtext)
{
	ini_open(global.fileselect);
	draw_set_font(global.candlefont);
	draw_set_halign(1);
	i = 0;
	Collectshake = 0;
	collected = -1;
	Collectshake = approach(Collectshake, 0, 20 / room_speed);
	shakeX = irandom_range(-Collectshake, Collectshake);
	shakeY = irandom_range(-Collectshake, Collectshake);
	_string = ini_read_string("Highscore", string(level), 0)
	var _string_length = string_length(_string);
	if (collected != _string)
	{
		for (i = 0; i < _string_length; i++)
			colors[i] = choose(0, 1, 2, 3, 4, 5, 6);
		collected = _string;
	}
	for (var i = 0; i < _string_length; i++)
	{
		var _xx = (-(string_width(_string) / 2) + ((string_width(_string) / _string_length) * i));
		var _yyoffset = ((i % 2) == 0) ? -4 : 0;
		pal = colors[i]
		pal_swap_set(spr_palcandle, pal, false);
		draw_text(x + _xx + shakeX, y + _yyoffset + shakeY - 100, string_char_at(_string, i + 1));
		shader_reset();
	}
	draw_set_font(global.smallfont);
	draw_set_color(c_white);
	var card1spr = (ini_read_string("Secret", string(level), 0) > 0 ? spr_rankcardflipped : spr_rankcard);
	var card2spr = (ini_read_string("Secret", string(level), 0) > 1 ? spr_rankcardflipped : spr_rankcard);
	var card3spr = (ini_read_string("Secret", string(level), 0) > 2 ? spr_rankcardflipped : spr_rankcard);
	draw_sprite(card1spr, 0, x - 62, y - 250);
	draw_sprite(card2spr, 0, x, y - 250);
	draw_sprite(card3spr, 0, x + 62, y - 250);
	for (i = 0; i < 5; i++)
	{
		var x_pos = -100 + (50 * i);
		var collected = ini_read_string("Confecti", string(level) + string(i + 1), 0);
		if (!collected)
			draw_sprite_ext_flash(confecti_sprs[i].sprite, confecti_sprs[i].image, x + x_pos, y - 328, 1, 1, 0, 0, 1);
		else
			draw_sprite_ext(confecti_sprs[i].sprite, confecti_sprs[i].image, x + x_pos, y - 328, 1, 1, 0, c_white, 1);
	}
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
			draw_set_font(global.rankfont);
			draw_set_halign(1);
			draw_text(x - 55, y - 216, string_repeat("E", (ini_read_string("ERankLength", string(level), 1))))
		}
    }
    else
	{
        draw_sprite_ext(_rankspr, 0, (x - 32), (y - 218), 1, 1, 0, c_white, 1)
		if (_rank == "e")
		{
			draw_set_font(global.rankfont);
			draw_set_halign(1);
			draw_text(x - 5, y - 216, string_repeat("E", (ini_read_string("ERankLength", string(level), 1))))
		}
	}
	draw_sprite(spr_gatecake, _cakespr, x, y - 150);
	ini_close();
}