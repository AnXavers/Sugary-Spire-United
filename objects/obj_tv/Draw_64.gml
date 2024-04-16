draw_set_alpha(promptalpha);
draw_set_halign(fa_center)
draw_text_scribble((global.cam_w / 2), global.cam_h - 140, "[shake]" + controlprompt);
draw_set_alpha(1);
if (is_hub() || !scr_roomcheck() || global.levelname == "none")
	exit;
bobbing = wave(2, -2, 3, 0);
draw_set_font(global.combofont);
draw_set_halign(fa_center);
draw_set_color(c_white);
var _cx = 652 + anchor_point("right");
var _hy = 88 + combo_y + hand_y;
_hy = clamp(_hy, 88, 142);
if (!surface_exists(goo_surface))
{
	goo_surface = surface_create(100, 180);
	surface_set_target(goo_surface);
	draw_clear_alpha(0, 0);
	surface_reset_target();
}
else if (obj_player.character == "S" || obj_player.character == "T" || obj_player.character == "V" || obj_player.character == "M" || obj_player.character == "GB")
{
	draw_set_halign(fa_right);
	draw_set_font(global.combopepfont);
	draw_sprite_ext(spr_tv_combobubblefill, -1, _cx - (hand_y * 2) + 214, _hy - hand_y + 112, 1, 1, 0, c_white, alpha);
	draw_sprite_ext(spr_tv_combobubble, -1, _cx + combo_x + 170, 200 + combo_y, 1, 1, 0, c_white, alpha);
	var _ct = string(global.combo) + "x";
	draw_text(_cx + combo_x + 123 + anchor_point("right"), combo_y + 192, _ct);
}
else
{
	surface_set_target(goo_surface);
	draw_clear_alpha(0, 0);
	draw_sprite(spr_combometer_goo, goo_index, -3, _hy + 6);
	gpu_set_blendmode(3);
	draw_sprite(spr_combometer_cut, 0, 0, 0);
	gpu_set_blendmode(bm_normal);
	surface_reset_target();
	draw_surface(goo_surface, (_cx + combo_x) - 50, (88 + combo_y) - 91);
	draw_sprite_ext(spr_combometer, -1, _cx + combo_x, 88 + combo_y, 1, 1, 0, c_white, alpha);
	draw_sprite_ext(spr_combometer_hand, -1, _cx + hand_x, _hy, 1, 1, 0, c_white, alpha);
	var _ct = string(global.combo) + "x";
	draw_text(_cx + combo_x, combo_y, _ct);
}
if (!surface_exists(tvbg_surface))
{
	tvbg_surface = surface_create(278, 268);
	surface_set_target(tvbg_surface);
	draw_clear_alpha(0, 0);
	surface_reset_target();
}
if !global.oldhud
{
	surface_set_target(tvbg_surface);
	draw_clear_alpha(0, 0);
	for (var i = 0; i < array_length(bg_details); i++)
	{
		if is_undefined(hscroll[i])
			hscroll[i] = 0
		hscroll[i] += bg_details[i][2]
		draw_sprite_tiled(bg_details[i][0], bg_details[i][1], hscroll[i] + (obj_player.x * bg_details[i][3] / 4), 0);
	}
	gpu_set_blendmode(3);
	draw_sprite(tvcutspr, 0, 0, 0);
	gpu_set_blendmode(bm_normal);
	surface_reset_target();
	draw_surface(tvbg_surface, 693 + anchor_point("right"), -60 + DrawY + bobbing)
	if (sprite_index != spr_tvturnon && (obj_player.character != "S" && obj_player.character != "T" && obj_player.character != "V" && obj_player.character != "M"))
		draw_sprite_ext(draw_static ? spr_tvpropellerstatic : spr_tvpropeller, propindex, 832 + anchor_point("right"), 74 + DrawY + bobbing, 1, 1, 0, c_white, 1);
}
var _remappedspr = spriteremap()
scr_palette_as_player();
draw_sprite_ext(_remappedspr, image_index, 832 - DrawX + anchor_point("right"), 74 + DrawY + bobbing + OldDrawY, 1, 1, 0, c_white, 1);
if (_remappedspr != spr_pizzanotv_panic && !global.oldhud)
	draw_sprite_ext(tvspr, image_index, 832 - DrawX + anchor_point("right"), 74 + DrawY + bobbing + OldDrawY, 1, 1, 0, c_white, 1);
pal_swap_reset();
if !global.oldhud
{
	if (draw_static)
	{
		static_index += 0.3;
		draw_sprite_ext(spr_tv_newstatic, static_index, 832 + anchor_point("right"), 74 + DrawY + bobbing, 1, 1, 0, c_white, 1);
	}
	if (tvsprite != spr_tvoff && tvsprite != spr_tvturnon)
	{
		if global.dialogueVolume <= 0
			draw_sprite_ext(spr_tvmuteicon, 0, 832 + DrawX + anchor_point("right"), 74 + DrawY + bobbing + OldDrawY, 1, 1, 0, c_white, 1);
		if obj_player.idletimer >= 400
			draw_sprite(spr_tv_sstv, 0, sstvx, sstvy)
	}
}
draw_set_font(global.promptfont);
draw_set_halign(fa_center);
draw_set_color(c_white);
var timerx = 480 + anchor_point("middle");
var timery = 490 + timer_y + anchor_point("bottom");
var minsx = timerx - 90;
var secx = timerx - 10;
var minsy = timery - 15;
var perc = clamp(1 - (target_fill / global.maxwave), 0, 1);
var john_ypos = -12 * perc;
var dist = clamp(perc * 268, 0, 268);
var timeinsecs = floor(target_fill / 60);
var mins = max(floor(timeinsecs / 60), 0);
var secs = max(timeinsecs % 60, 0);
if ((global.panic == 1 || global.starrmode == 1) && global.gamemode != 1 && !instance_exists(obj_lowface))
{
	if (!sucroseTimer)
		target_fill = lerp(target_fill, global.fill, 0.03);
	else
		draw_set_color(c_white)
		if instance_exists(obj_yogurtexe)
			target_fill = approach(target_fill, global.fill_4, 10)
		else
			target_fill = approach(target_fill, global.fill, 10);
	var gaining_time = global.fill > target_fill;
	var display_mins = string(abs(mins));
	var display_secs = string(abs(secs));
	if (secs < 10)
		display_secs = "0" + display_secs;
	if (!sucroseTimer)
	{
		if (coneball_sprite != spr_bartimer_showtime)
		{
			draw_sprite_ext(spr_bartimer_normalBack, coneball_index, timerx, timery, 1, 1, 0, c_white, 1);
			draw_sprite_part(spr_bartimer_strip, 0, 0, 0, dist + 45, 113, timerx - 184, timery - 56);
			draw_sprite_ext(spr_bartimer_roll, roll_index, (timerx - 147) + dist, timery + john_ypos + 31, 1, 1, 0, c_white, 1);
		}
		draw_sprite_ext(coneball_sprite, floor(coneball_index), timerx, timery, 1, 1, 0, c_white, 1);
		draw_text(timerx, timery - 50, display_mins + ":" + display_secs);
	}
	else if instance_exists(obj_yogurtexe)
	{
		var c_alpha = random_range(0.35, 0.78)
		draw_set_font(global.timerfont)
		draw_set_halign(fa_left)
		var _tmr_spr = oldTimer_sprite
		if (_tmr_spr == spr_timer && gaining_time)
			_tmr_spr = spr_timer_gain
		draw_sprite_ext(oldBall_sprite, oldBall_index, timerx, timery, 1, 1, 0, c_white, 1)
		draw_sprite_ext(_tmr_spr, 1, timerx, timery, 1, 1, 0, c_white, 1)
		if (mins < 10)
			display_mins = ("0" + display_mins)
		if (oldTimer_sprite != spr_timeryogurt_agr)
		{
			draw_set_color((gaining_time ? c_blue : c_blue))
			draw_set_alpha(c_alpha)
			draw_text(minsx, minsy, display_mins)
			draw_text(secx, (minsy + 1), display_secs)
			draw_set_alpha(1)
			draw_set_color(c_white)
		}
		draw_sprite_ext(spr_timer_lap4c, 0, timerx, timery, 1, 1, 0, c_white, 1)
	}
	else
	{
		draw_set_font(global.timerfont);
		draw_set_halign(0);
		var _tmr_spr = oldTimer_sprite;
		if (_tmr_spr == spr_timer && gaining_time)
			_tmr_spr = spr_timer_gain;
		draw_sprite_ext(oldBall_sprite, oldBall_index, timerx, timery, 1, 1, 0, c_white, 1);
		draw_sprite_ext(_tmr_spr, oldTimer_index, timerx, timery, 1, 1, 0, c_white, 1);
		if (mins < 10)
			display_mins = "0" + display_mins;
		if (oldTimer_sprite != spr_timer_timesup)
		{
			draw_set_color(gaining_time ? 0x48D060 : 0x0000F8);
			draw_text(minsx, minsy, display_mins);
			draw_text(secx, minsy + 1, display_secs);
			draw_set_color(c_white);
		}
	}
}
var tgt = -100;
var spd = 2;
if (lap_out > 0)
{
	tgt = 90;
	spd = 2;
	lap_out--;
}
lap_y = approach(lap_y, tgt, spd);
draw_set_halign(fa_center);
draw_set_font(global.smalllapfont);
var y_wave = wave(-3, 3, 4, 0)
var x_wave = wave(-2, 2, 3, 0)
var x_wave2 = wave(-2, 2, 3, 0, current_time + 600)
if (global.lapcount >= 2)
{
	if (global.lapmode != 0)
	{
		draw_set_halign(fa_center);
		draw_sprite(spr_lappingportal_HUD, floor(frameref * 0.35), 50 + x_wave, (global.cam_h - 50));
		draw_text(50 + x_wave2, global.cam_h + y_wave - 98, global.lapcount);
	}
	if global.checkpoints
	{
		if checkpointalpha >= 1
		{
			checkpointspr = spr_checkpointflag_appear
			checkpointindex += 0.35
			draw_sprite_ext(checkpointspr, floor(checkpointindex), 140, global.cam_h - 65, 1, 1, 0, c_white, checkpointalpha)
			if floor(checkpointindex) == (sprite_get_number(spr_checkpointflag_appear) - 1)
			{
				checkpointspr = spr_checkpointflag
				checkpointalpha = 0.95
			}
		}
		else
		{
			if checkpointspr == spr_checkpointflag_unvisit
				checkpointalpha += 0.05
			else
				checkpointalpha -= 0.05
			draw_sprite_ext(checkpointspr, floor(frameref * 0.35), 140, global.cam_h - 65, 1, 1, 0, c_white, checkpointalpha)
		}
	}
}
if (shownewtext == 1 && global.tvmessages)
{
	draw_sprite_ext(textbubblesprites, floor(textbubbleframes), 448 + anchor_point("right"), 45, 1, 1, 0, c_white, 1);
	if (!surface_exists(textpromptsurface))
		textpromptsurface = surface_create(300, 100);
	surface_set_target(textpromptsurface);
	draw_clear_alpha(0, 0);
	var _new_message = new_message;
	draw_set_font(global.npcfont);
	draw_set_halign(0);
	draw_set_color(c_black);
	if (textbubblesprites == spr_null || textbubblesprites == spr_tv_bubbleclosed)
	{
		textbubblesprites = spr_tv_bubbleopen
		text_x = 300
	}
	if (textbubblesprites == spr_tv_bubble)
	{
		var _length = -(floor(string_width(_new_message[0])) + 5);
		if (floor(text_x) <= _length)
		{
			textbubblesprites = spr_tv_bubbleclose;
			textbubbleframes = 0;
		}
		draw_text(text_x, 30, _new_message[0]);
	}
	surface_reset_target();
	if (surface_exists(textpromptsurface))
		draw_surface(textpromptsurface, 283 + anchor_point("right"), -10);
	if (textbubblesprites == spr_tv_bubble)
		draw_sprite(spr_tv_bubblefade, -1, 448 + anchor_point("right"), 45);
	draw_set_color(c_white);
}
