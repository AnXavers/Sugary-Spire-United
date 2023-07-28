if (DrawHUD)
{
	var shakeX = irandom_range(-Collectshake, Collectshake);
	var shakeY = irandom_range(-Collectshake, Collectshake);
	if (room != scootercutsceneidk && room != rm_credits && room != devroom && room != palroom && room != rank_room && room != rm_introVideo && room != realtitlescreen)
	{
		pal_swap_set(spr_heatpal, heatpal, 0);
		draw_sprite_part_ext(spr_heatmeterunder, obj_stylebar.image_index, 0, 0, (global.style * 4.25) / 4, sprite_get_height(spr_heatmeterunder), -6 + shakeX, 8 + DrawY + shakeY, 1, 1, c_white, 1);
		draw_sprite_ext(spr_heatmeter, obj_stylebar.image_index, 128 + shakeX, 96 + shakeY + DrawY, 1, 1, 0, c_white, 1);
		draw_sprite_ext(spr_cakehud, obj_stylebar.image_index, 128 + shakeX, 96 + shakeY + DrawY, 1, 1, 0, c_white, 1);
		if (global.collect > global.crank)
			draw_sprite_ext(spr_cranktopping, obj_stylebar.image_index, 128 + shakeX, 96 + shakeY + DrawY, 1, 1, 0, c_white, 1);
		if (global.collect > global.brank)
			draw_sprite_ext(spr_branktopping, obj_stylebar.image_index, 128 + shakeX, 96 + shakeY + DrawY, 1, 1, 0, c_white, 1);
		if (global.collect > global.arank)
			draw_sprite_ext(spr_aranktopping, obj_stylebar.image_index, 128 + shakeX, 96 + shakeY + DrawY, 1, 1, 0, c_white, 1);
		if (global.collect > global.srank)
			draw_sprite_ext(spr_sranktopping, obj_stylebar.image_index, 128 + shakeX, 96 + shakeY + DrawY, 1, 1, 0, c_white, 1);
		shader_reset();
		draw_set_font(global.collectfont);
		draw_set_halign(1);
		draw_set_color(c_white);
		var _string = string(global.collect);
		var _string_length = string_length(_string);
		for (var i = 0; i < _string_length; i++)
		{
			var _xx = 140 + (-(string_width(_string) / 2) + ((string_width(_string) / _string_length) * i));
			var _yyoffset = ((i % 2) == 0) ? -4 : 0;
			draw_text(_xx + shakeX, 29 + obj_stylebar.hudbounce + _yyoffset + DrawY + shakeY, string_char_at(_string, i + 1));
		}
	}
	draw_set_font(global.promptfont);
	draw_set_halign(0);
	draw_set_color(c_white);
}
if (global.levelname != "none" && global.showplaytimer && room != hub_w1 && room != hub_w2 && room != timesuproom && !instance_exists(obj_endlevelfade) && !instance_exists(obj_titlecard) && room != rm_titlecard)
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
if (global.levelname != "none" && !(room == timesuproom || room == rank_room || room == timesuproom || room == hub_w1 || room == hub_w2 || room == hub_basement || instance_exists(obj_bosscontroller)))
{
	if (!instance_exists(obj_startgate))
	{
		var bubbleempty = spr_rankbubble_d;
		var bubblefilled = spr_rankbubble_dfilled;
		var local_rank = global.crank;
		var minus_moment = 0;
		var bubbleframe = 0;
		switch (global.currentrank)
		{
			case "P":
				bubbleempty = spr_rankbubble_p;
				bubblefilled = spr_rankbubble_pfilled;
				local_rank = global.srank;
				minus_moment = global.srank;
				bubbleframe = 0;
			case "S":
				bubbleempty = spr_rankbubble_s;
				bubblefilled = spr_rankbubble_sfilled;
				local_rank = global.srank;
				minus_moment = global.arank;
				bubbleframe = 0;
				break;
			case "A":
				bubbleempty = spr_rankbubble_a;
				bubblefilled = spr_rankbubble_afilled;
				local_rank = global.srank;
				minus_moment = global.arank;
				bubbleframe = 1;
				break;
			case "B":
				bubbleempty = spr_rankbubble_b;
				bubblefilled = spr_rankbubble_bfilled;
				local_rank = global.arank;
				minus_moment = global.brank;
				bubbleframe = 2;
				break;
			case "C":
				bubbleempty = spr_rankbubble_c;
				bubblefilled = spr_rankbubble_cfilled;
				local_rank = global.brank;
				minus_moment = global.crank;
				bubbleframe = 3;
				break;
			default:
				bubbleempty = spr_rankbubble_d;
				bubblefilled = spr_rankbubble_dfilled;
				local_rank = global.crank;
				minus_moment = 0;
				bubbleframe = 4;
				break;
		}
		var bubbleWidth = sprite_get_width(bubblefilled);
		var bubbleHeight = sprite_get_height(bubblefilled);
		var rankpercent = (global.collect - minus_moment) / (local_rank - minus_moment);
		if (!surface_exists(rankbubblesurface))
			rankbubblesurface = surface_create(96, 96);
		else if (surface_exists(rankbubblesurface))
		{
			surface_set_target(rankbubblesurface);
			draw_clear_alpha(c_white, 0);
			draw_sprite_ext(spr_rankbubble_bg, bubbleframe, surface_get_width(rankbubblesurface) / 2, (surface_get_height(rankbubblesurface) / 2) + DrawY, 1, 1, 0, c_white, 1);
			if (global.currentrank == "P")
				draw_sprite_ext(spr_rankbubble_pfilled, -1, 16, 16 + DrawY, 1, 1, 0, c_white, 1);
			else if (global.currentrank == "S")
				draw_sprite_ext(spr_rankbubble_sfilled, -1, 16, 16 + DrawY, 1, 1, 0, c_white, 1);
			else
			{
				draw_sprite_ext(bubbleempty, -1, 16, 16 + DrawY, 1, 1, 0, c_white, 1);
				draw_sprite_part_ext(bubblefilled, -1, 0, bubbleHeight - (bubbleHeight * rankpercent), bubbleWidth, bubbleHeight * rankpercent, 16, 16 + ((bubbleHeight - (bubbleHeight * rankpercent)) + DrawY), 1, 1, c_white, 1);
			}
			surface_reset_target();
			draw_surface_ext(rankbubblesurface, (200 - ((surface_get_width(rankbubblesurface) / 2) * bubblescale)) + 1, (5 - ((surface_get_height(rankbubblesurface) / 2) * bubblescale)) + 1, 1 + bubblescale, 1 + bubblescale, 0, c_white, alpha);
		}
	}
}
if (global.debugmode == 1)
{
	draw_set_font(global.promptfont);
	draw_set_halign(1);
	draw_set_color(c_white);
	draw_text(260, 450, angle);
	draw_text(325, 450, angledir);
	draw_text(100, 400, obj_player.x);
	draw_text(100, 450, obj_player.y);
	var roomname = string_upper(room_get_name(global.GMLIVE_realroom));
	draw_text(150, 0, roomname);
}
if (global.debugmode == 1)
{
	draw_set_font(font_dev);
	draw_set_halign(0);
	draw_set_color(c_white);
	draw_text(0, 50, fps_real);
	roomname = string_upper(room_get_name(room));
	draw_text(0, 100, roomname);
	var spritename = string_upper(sprite_get_name(obj_player.sprite_index));
	draw_text(0, 150, spritename);
}
if (global.screenflash > 0)
	draw_rectangle_color(0, 0, 960, 540, c_white, c_white, c_white, c_white, 0);
if (global.dancetimer > 0)
	draw_text(480, 100, global.dancetimer);
