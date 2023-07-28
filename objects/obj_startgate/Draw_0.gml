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
	draw_set_font(global.smallfont);
	draw_set_halign(1);
	draw_set_color(c_white);
	ini_open("saveData.ini");
	draw_text(x, y - 252, string(ini_read_string("Highscore", string(level), 0)) + " POINTS - " + string(ini_read_string("Laps", string(level), 0)) + " LAPS");
	draw_text(x, y - 278, ini_read_string("Secret", string(level), 0) + " OF 3 SECRETS");
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
	switch (_rank)
	{
		case "p":
			_rankspr = spr_rankbubble_pfilled;
			break;
		case "s":
			_rankspr = spr_rankbubble_sfilled;
			break;
		case "a":
			_rankspr = spr_rankbubble_a;
			break;
		case "b":
			_rankspr = spr_rankbubble_b;
			break;
		case "c":
			_rankspr = spr_rankbubble_c;
			break;
		case "d":
			_rankspr = spr_rankbubble_d;
			break;
		default:
			_rankspr = spr_null;
			break;
	}
	draw_sprite_ext(_rankspr, 0, x - 32, y - 218, 1, 1, 0, c_white, 1);
	ini_close();
}
