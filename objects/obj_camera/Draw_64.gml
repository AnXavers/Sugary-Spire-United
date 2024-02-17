if (DrawHUD)
{
	var shakeX = irandom_range(-Collectshake, Collectshake);
	var shakeY = irandom_range(-Collectshake, Collectshake);
	if !(room == scootercutsceneidk && room == rm_credits && room == devroom && room == palroom && room == rank_room && room == rm_introVideo && room == realtitlescreen)
	{
		if global.heatmeter
		{
			pal_swap_set(obj_player.spr_heatmeterpal, heatpal, 0);
			draw_sprite_part_ext(obj_player.spr_stylebarunder, obj_stylebar.image_index, 0, 0, (global.style * 4.25) / 4, sprite_get_height(obj_player.spr_stylebarunder), -6 + shakeX + cakeX, 8 + DrawY + shakeY, 1, 1, c_white, 1);
			if (obj_player.character = "V" || obj_player.character = "M" || obj_player.character = "S" || obj_player.character = "T")
				shader_reset()
			draw_sprite_ext(obj_player.spr_stylebar, obj_stylebar.image_index, 128 + shakeX + cakeX, 96 + shakeY + DrawY, 1, 1, 0, c_white, 1);
		}
		draw_sprite_ext(obj_player.spr_collecthud, obj_stylebar.image_index, 128 + shakeX + cakeX, 96 + shakeY + DrawY, 1, 1, 0, c_white, 1);
		if (global.collect > global.crank)
			draw_sprite_ext(obj_player.spr_crankhud, obj_stylebar.image_index, 128 + shakeX + cakeX, 96 + shakeY + DrawY, 1, 1, 0, c_white, 1);
		if (global.collect > global.brank)
			draw_sprite_ext(obj_player.spr_brankhud, obj_stylebar.image_index, 128 + shakeX + cakeX, 96 + shakeY + DrawY, 1, 1, 0, c_white, 1);
		if (global.collect > global.arank)
			draw_sprite_ext(obj_player.spr_arankhud, obj_stylebar.image_index, 128 + shakeX + cakeX, 96 + shakeY + DrawY, 1, 1, 0, c_white, 1);
		if (global.collect > global.srank)
			draw_sprite_ext(obj_player.spr_srankhud, obj_stylebar.image_index, 128 + shakeX + cakeX, 96 + shakeY + DrawY, 1, 1, 0, c_white, 1);
		shader_reset();
		draw_set_halign(fa_center);
		draw_set_color(c_white);
		var _string = string(global.collect);
		var _string_length = string_length(_string);
		if global.newscorefont == 0
		{
			draw_set_font(obj_player.font_collect);
			for (var i = 0; i < _string_length; i++)
			{
				var _xx = 140 + (-(string_width(_string) / 2) + ((string_width(_string) / _string_length) * i));
				var _yyoffset = ((i % 2) == 0) ? -4 : 0;
				draw_text(_xx + shakeX + cakeX, 29 + obj_stylebar.hudbounce + _yyoffset + DrawY + shakeY, string_char_at(_string, i + 1));
			}
		}
		else
		{
			var _palspr = spr_palcandle
			var _font = global.candlefont
			if global.newscorefont == 2
			{
				_palspr = spr_palcandle_new
				_font = global.newcandlefont
			}
			draw_set_font(_font)
			if (collected != _string)
			{
				for (i = 0; i < _string_length; i++)
					colors[i] = irandom(sprite_get_width(_palspr) - 1);
				collected = _string;
			}
			for (var i = 0; i < _string_length; i++)
			{
				var _xx = 145 + (-(string_width(_string) / 2) + ((string_width(_string) / _string_length) * i));
				var _yyoffset = ((i % 2) == 0) ? -4 : 0;
				pal = colors[i]
				pal_swap_set(_palspr, pal, false);
				draw_text(_xx + shakeX + cakeX, 29 + obj_stylebar.hudbounce + _yyoffset + DrawY + shakeY, string_char_at(_string, i + 1));
				shader_reset();
			}
		}
		draw_set_font(global.promptfont);
		draw_set_halign(fa_center);
		draw_set_color(c_white);
		var _cx = (global.cam_w / 2)
		frameref++
		if global.conedowntime > -1
		{
			var _display_mins = string(frames_in_minutes(global.conedowntime))
			var _display_secs = string(((frames_in_seconds(global.conedowntime)) mod 60))
			if string_length(_display_secs) == 1
				_display_secs = ("0" + _display_secs)
			draw_sprite_ext(obj_player.spr_coneball_melting_player, floor(frameref * 0.35), _cx, 120, 1, 1, 0, c_white, 0.5)
			draw_text(_cx, 105, _display_mins + ":" + _display_secs);
		}
		if global.gamemode == 1
		{
			if ((floor(frameref * 0.1) mod 2) && global.getawayfill < 0)
				draw_set_color(c_red);
			var _display_mins = string(frames_in_minutes(global.getawayfill))
			var _display_secs = string(((frames_in_seconds(global.getawayfill)) mod 60))
			if string_length(_display_secs) == 1
				_display_secs = ("0" + _display_secs)
			draw_text(_cx, 430, _display_mins + ":" + _display_secs);
			var _getawayclock = spr_getawayclock_normal
			if global.getawayfill < time_in_frames(0, 11)
				_getawayclock = spr_getawayclock_panic
			draw_sprite(_getawayclock, floor(frameref * 0.35), _cx + 120, 430)
		}
		else if (instance_exists(obj_secretfound) && global.levelname == "secrets")
		{
			var _display_mins = string(frames_in_minutes(global.secrettime))
			var _display_secs = string(((frames_in_seconds(global.secrettime)) mod 60))
			if string_length(_display_secs) == 1
				_display_secs = ("0" + _display_secs)
			draw_text(_cx, 430, _display_mins + ":" + _display_secs);
		}
		if instance_exists(obj_lowface)
		{
			var _cammid = (global.cam_w / 2)
			var _timerspr = spr_timer_lowface
			if global.lowfacefill < 1
				_timerspr = spr_timer_lowface_showtime
			draw_sprite(_timerspr, 0, _cammid, lowfacetimery)
			if global.lowfacefill >= 1
			{
				var _mins = string(frames_in_minutes(global.lowfacefill))
				if string_length(_mins) == 1
					_mins = "0" + _mins
				var _secs = string((frames_in_seconds(global.lowfacefill) mod 60))
				if string_length(_secs) == 1
					_secs = "0" + _secs
				draw_text(_cammid - 45, lowfacetimery - 30, _mins)
				draw_text(_cammid + 45, lowfacetimery - 30, _secs)
			}
		}
	}
	draw_set_font(global.promptfont);
	draw_set_halign(0);
	draw_set_color(c_white);
}
if !(global.levelname == "none" && global.showplaytimer && is_hub() && room = timesuproom && instance_exists(obj_endlevelfade) && instance_exists(obj_titlecard) && room == rm_titlecard)
{
	var tiny = ":";
	var tinier = ":";
	var tinyish = ":";
	if (global.playseconds < 10)
		tiny = ":0";
	if (global.playmiliseconds < 10)
		tinier = ":0";
	if (global.playminutes < 10)
		tinyish = ":0";
	draw_set_color(c_white);
	draw_set_halign(0);
	draw_set_font(global.smallfont);
	draw_text(823, 512, string_hash_to_newline(string(global.playhour) + string(tinyish) + string(global.playminutes) + string(tiny) + string(global.playseconds) + string(tinier) + string(global.playmiliseconds)));
}
if !(global.levelname == "none" && room == timesuproom || room == rank_room || room == timesuproom || is_hub() || instance_exists(obj_bosscontroller))
{
	if (!instance_exists(obj_startgate))
	{
		var bubbleempty = obj_player.spr_rankbubble_D;
		var bubblefilled = obj_player.spr_rankbubble_Dfilled;
		var local_rank = global.crank;
		var minus_moment = 0;
		var bubbleframe = 0;
		switch (global.currentrank)
		{
			case "E":
				bubbleempty = obj_player.spr_rankbubble_E;
				bubblefilled = obj_player.spr_rankbubble_Eempty;
				local_rank = global.srank;
				minus_moment = global.srank;
				bubbleframe = 0;
			case "P":
				bubbleempty = obj_player.spr_rankbubble_P;
				bubblefilled = obj_player.spr_rankbubble_Pfilled;
				local_rank = global.srank;
				minus_moment = global.srank;
				bubbleframe = 0;
			case "S":
				bubbleempty = obj_player.spr_rankbubble_S;
				bubblefilled = obj_player.spr_rankbubble_Sfilled;
				local_rank = global.srank;
				minus_moment = global.arank;
				bubbleframe = 0;
				break;
			case "A":
				bubbleempty = obj_player.spr_rankbubble_A;
				bubblefilled = obj_player.spr_rankbubble_Afilled;
				local_rank = global.srank;
				minus_moment = global.arank;
				bubbleframe = 1;
				break;
			case "B":
				bubbleempty = obj_player.spr_rankbubble_B;
				bubblefilled = obj_player.spr_rankbubble_Bfilled;
				local_rank = global.arank;
				minus_moment = global.brank;
				bubbleframe = 2;
				break;
			case "C":
				bubbleempty = obj_player.spr_rankbubble_C;
				bubblefilled = obj_player.spr_rankbubble_Cfilled;
				local_rank = global.brank;
				minus_moment = global.crank;
				bubbleframe = 3;
				break;
			default:
				bubbleempty = obj_player.spr_rankbubble_D;
				bubblefilled = obj_player.spr_rankbubble_Dfilled;
				local_rank = global.crank;
				minus_moment = 0;
				bubbleframe = 4;
				break;
		}
		var bubbleWidth = sprite_get_width(bubblefilled);
		var bubbleHeight = sprite_get_height(bubblefilled);
		var rankpercent = (global.collect - minus_moment) / (local_rank - minus_moment);
		if (!surface_exists(rankbubblesurface))
		{
			rankbubblesurface = surface_create(96, 96);
		}
		else if (surface_exists(rankbubblesurface))
		{
			surface_set_target(rankbubblesurface);
			draw_clear_alpha(c_white, 0);
			if (global.currentrank == "E")
			{
				draw_sprite_ext(obj_player.spr_rankbubble_Eempty, -1, 16, 16 + DrawY, 1, 1, 0, c_white, 1);
			}
			else if (global.currentrank == "P")
			{
				draw_sprite_ext(obj_player.spr_rankbubble_Pfilled, -1, 16, 16 + DrawY, 1, 1, 0, c_white, 1);
				global.Eranklength = 0;
			}
			else if (global.currentrank == "S")
			{
				draw_sprite_ext(obj_player.spr_rankbubble_Sfilled, -1, 16, 16 + DrawY, 1, 1, 0, c_white, 1);
				global.Eranklength = 0;
			}
			else
			{
				draw_sprite_ext(bubbleempty, -1, 16, 16 + DrawY, 1, 1, 0, c_white, 1);
				draw_sprite_part_ext(bubblefilled, -1, 0, bubbleHeight - (bubbleHeight * rankpercent), bubbleWidth, bubbleHeight * rankpercent, 16, 16 + ((bubbleHeight - (bubbleHeight * rankpercent)) + DrawY), 1, 1, c_white, 1);
			}
			surface_reset_target();
			draw_surface_ext(rankbubblesurface, (200 - ((surface_get_width(rankbubblesurface) / 2) * bubblescale)) + 1, (5 - ((surface_get_height(rankbubblesurface) / 2) * bubblescale)) + 1, 1 + bubblescale, 1 + bubblescale, 0, c_white, alpha);
			if (global.currentrank == "E")
			{
				global.Eranklength = global.lapcount - 9
				draw_set_font(global.erankfont);
				draw_set_halign(fa_center);
				if !global.erankstack
					draw_text(244, 24, string_repeat("E", global.Eranklength));
				else
				{
					draw_text(244, 24, "E");
					if global.Eranklength > 1
					{
						draw_set_halign(fa_left);
						draw_text(260, 24, "x" + string(global.Eranklength));
					}
				}
			}
		}
	}
}
if (global.debugmode == 1)
{
	draw_set_font(global.promptfont);
	draw_set_halign(fa_center);
	draw_set_color(c_white);
	draw_text(260, 450, angle);
	draw_text(325, 450, angledir);
	draw_text(100, 400, obj_player.x);
	draw_text(100, 450, obj_player.y);
	draw_set_font(font_dev);
	draw_set_halign(0);
	draw_set_color(c_white);
	draw_text(0, 50, fps_real);
	var roomname = string_upper(room_get_name(room));
	draw_text(0, 100, roomname);
	var spritename = string_upper(sprite_get_name(obj_player.sprite_index));
	draw_text(0, 150, spritename);
}
if (global.screenflash > 0)
	draw_rectangle_color(0, 0, 960, 540, c_white, c_white, c_white, c_white, 0);
if (global.dancetimer > 0)
{
	draw_set_font(global.npcfont)
	var _display_mins = string(frames_in_minutes(global.dancetimer))
	var _display_secs = string(((frames_in_seconds(global.dancetimer)) mod 60))
	if string_length(_display_secs) == 1
		_display_secs = ("0" + _display_secs)
	var _cammid = (global.cam_w / 2)
	draw_sprite_ext(spr_onoffblock_gui, index, _cammid, 100, 2, 1, 0, c_white, 1)
	draw_text_scribble(_cammid, 100, "[shake]" + "[fa_center]" + "[fa_middle]" + _display_mins + ":" + _display_secs);
}
if (global.dogtimer > 0)
{
	draw_set_font(global.dogtimerfont)
	draw_set_halign(fa_left)
	var _display_mins = string(frames_in_minutes(global.dogtimer))
	var _display_secs = string(((frames_in_seconds(global.dogtimer)) mod 60))
	if string_length(_display_secs) == 1
		_display_secs = ("0" + _display_secs)
	draw_sprite(spr_dogtimer_bg, 0, 0, global.cam_h + dogtimery)
	draw_sprite(spr_dogtimer_limit, 0, global.cam_w - 50, global.cam_h + dogtimery)
	draw_text(30, global.cam_h - 140 + dogtimery, _display_mins + ":" + _display_secs);
}
index += 0.35