scr_tvsprites();
if (!visible)
	sprite_index = spr_tvoff;
if (!(obj_player.state == 19 && obj_player.state == 20 && obj_player.state == 13))
	once = 0;
if (obj_player.y < (180 + obj_camera.Cam_y) && obj_player.x > ((camera_get_view_width(view_camera[0]) - 350) + obj_camera.Cam_x))
{
	DrawY = lerp(DrawY, -300, 0.15);
	alpha = 0.5;
}
else
{
	DrawY = lerp(DrawY, 0, 0.15);
	alpha = 1;
}
if (global.hurtcounter >= global.hurtmilestone && global.hurtcounter >= 5)
{
	showtext = 1;
	alarm[0] = 150;
	if (obj_player.character == "P")
		character = "Pizzelle";
	else
		character = "Pizzano";
	scr_controlprompt("You have hurt " + string(character) + " " + string(global.hurtmilestone) + " times...", -4, 150);
	global.hurtmilestone += 5;
}
if (obj_player.state == 56)
{
	showtext = 1;
	message = "Key obtained!";
	alarm[0] = 50;
}
if (staticdraw)
	statictimer--;
if (statictimer < 0)
	staticdraw = false;
var allstate = global.freezeframe ? obj_player.frozenstate : obj_player.state;
switch (state)
{
	case 1:
		if (!instance_exists(obj_secretfound))
		{
			idlespr = idletvspr;
			if (obj_player.angry)
				idlespr = angrytvspr;
			if (global.panic)
				idlespr = panictvspr;
		}
		else
			idlespr = secrettvspr;
		var _transfo = true;
		switch (allstate)
		{
			case 68:
			case 69:
			case 17:
			case 71:
			case 11:
			case 31:
			case 67:
			default:
				_transfo = false;
				break;
			case 70:
				_transfo = false;
				var my_mvsp = global.freezeframe ? abs(obj_player.frozenhsp) : abs(obj_player.hsp);
				if (allstate == 11)
					my_mvsp = global.freezeframe ? abs(obj_player.frozenvsp) : abs(obj_player.vsp);
				idlespr = mach1tvspr;
				if (my_mvsp >= 8 || allstate == 17)
					idlespr = mach2tvspr;
				if (my_mvsp >= 12 || allstate == 70)
					idlespr = mach3tvspr;
				if (my_mvsp >= 20 || obj_player.sprite_index == obj_player.spr_crazyrun)
					idlespr = mach4tvspr;
				if (allstate == 17 || allstate == 67)
					idlespr = mach1tvspr;
				if (allstate == 31)
					idlespr = machrolltvspr;
				break;
			case 126:
				idlespr = hooktvspr;
				break;
			case 101:
				idlespr = minecarttvspr;
				break;
			case 108:
				idlespr = firetvspr;
				break;
			case 22:
				idlespr = bombtvspr;
				break;
			case 88:
			case 97:
			case 98:
				idlespr = cottontvspr;
				break;
			case 140:
			case 142:
			case 141:
			case 150:
			case 148:
			case 149:
			case 151:
				idlespr = frostburntvspr;
				break;
			case 99:
				idlespr = orbtvspr;
				break;
			case 48:
				idlespr = ufotvspr;
				break;
			case 83:
				idlespr = marshdogspr;
				break;
		}
		if (!_transfo)
		{
			if (allstate == 73)
				scr_queue_tvanim(hurttvspr, 60);
			if ((global.combo % 3) == 0 && playComboVariable != global.combo && global.combotime > 0 && global.combo > 0)
			{
				scr_queue_tvanim(combotvspr, 250);
				playComboVariable = global.combo;
			}
		}
		switch (sprite_index)
		{
			case spr_tvoff:
				if (visible)
				{
					sprite_index = spr_tvturnon;
					image_index = 0;
				}
				break;
			case spr_tvturnon:
				if (floor(image_index) == (image_number - 1))
					sprite_index = idletvspr;
				break;
			case idletvspr:
				idleanim--;
				if (idleanim <= 0 && floor(image_index) == (image_number - 1))
				{
					sprite_index = choose(tvchange1, tvchange2);
					image_index = 0;
				}
				break;
			case tvchange1:
			case tvchange2:
				if (floor(image_index) == (image_number - 1))
				{
					sprite_index = idlespr;
					idleanim = choose(500, 450, 400, 550);
				}
				break;
		}
		if (saved_tv_spr != idlespr && !draw_static && !global.freezeframe)
		{
			saved_tv_spr = idlespr;
			draw_static = true;
			state = 155;
			static_index = 0;
		}
		break;
	case 155:
		draw_static = true;
		saved_tv_spr = idlespr;
		if (floor(static_index) >= 4)
		{
			if (expressionsprite != -4)
			{
				state = 156;
				sprite_index = expressionsprite;
			}
			else
			{
				state = 1;
				sprite_index = saved_tv_spr;
			}
			image_index = 0;
			draw_static = 0;
		}
		break;
	case 156:
		switch (expressionsprite)
		{
			case hurttvspr:
				if (allstate != 73)
					expressiontime--;
				break;
			default:
				expressiontime--;
				break;
		}
		if (expressiontime <= 0)
		{
			state = 155;
			expressionsprite = -4;
			draw_static = true;
			static_index = 0;
		}
		break;
}
if (textbubblesprites == spr_tv_bubbleopen && floor(textbubbleframes) >= (sprite_get_number(spr_tv_bubbleopen) - 1))
	textbubblesprites = spr_tv_bubble;
if (textbubblesprites == spr_tv_bubble)
	text_x += -3;
if (textbubblesprites == spr_tv_bubbleclose && floor(textbubbleframes) >= (sprite_get_number(spr_tv_bubbleclose) - 1))
{
	new_message = "";
	shownewtext = false;
	showingnewtext = false;
	textbubbleframes = 0;
	text_x = 300;
}
switch (obj_player.state)
{
	case 88:
	case 97:
	case 98:
		if (ds_list_find_index(global.saveroom, "cotton") == -1)
		{
			scr_queue_message("Mmmph!! MMMPH!! MMPPH! (This cotton is quite a delicacy, isn't it?)");
			ds_list_add(global.saveroom, "cotton");
		}
		break;
	case 101:
		if (ds_list_find_index(global.saveroom, "minecart") == -1)
		{
			scr_queue_message("Easy... easy... hold on to your hats... hard hats, rather.");
			ds_list_add(global.saveroom, "minecart");
		}
		break;
	case 108:
		if (ds_list_find_index(global.saveroom, "fireass") == -1)
		{
			scr_queue_message("Breaking news... local candy maker finds himself burned by caramel.");
			scr_queue_message("What an idiot. How does that even happen?");
			ds_list_add(global.saveroom, "fireass");
		}
		break;
	case 99:
		if (ds_list_find_index(global.saveroom, "fling") == -1)
		{
			scr_queue_message("Aughh!! What kind of black magic has this flying frog casted upon me?! Feels kinda nice.");
			ds_list_add(global.saveroom, "fling");
		}
		break;
	case 125:
		if (ds_list_find_index(global.saveroom, "flushed") == -1)
		{
			scr_queue_message("Incredibly cold temperatures are causing random individuals to be frozen solid. We recommend you stay inside during these chilly times.");
			ds_list_add(global.saveroom, "flushed");
		}
		break;
}
switch (obj_player.character)
{
	case "P":
		voice1 = sfx_combovoice1p;
		voice2 = sfx_combovoice2p;
		voice3 = sfx_combovoice3p;
		voice4 = sfx_combovoice4p;
		voice5 = sfx_combovoice5p;
		voice6 = sfx_combovoice6p;
		voice7 = sfx_combovoice7p;
		voice8 = sfx_combovoice8p;
		break;
	case "N":
	default:
		voice1 = sfx_combovoice1n;
		voice2 = sfx_combovoice2n;
		voice3 = sfx_combovoice3n;
		voice4 = sfx_combovoice4n;
		voice5 = sfx_combovoice5n;
		voice6 = sfx_combovoice6n;
		voice7 = sfx_combovoice7n;
		voice8 = sfx_combovoice8n;
		break;
}
propindex += 0.5;
statindex += 0.3;
if (global.key_inv == 1)
	invsprite = spr_invkey;
else if (global.treat == 1 && global.key_inv != 1)
	invsprite = spr_invdonut;
else
	invsprite = spr_invempty;
var timeinsecs = floor(target_fill / 60);
var secs = max(timeinsecs % 60, 0);
goo_index += 0.22;
if (goo_index >= (sprite_get_number(spr_combometer_goo) - 1))
	goo_index = frac(goo_index);
if (global.panic)
{
	if (global.fill > 0)
	{
		var _spd = (1 - (target_fill / global.maxwave)) * (sprite_get_number(spr_bartimer_roll) * 10);
		roll_index = _spd % sprite_get_number(spr_bartimer_roll);
		oldTimer_index = secs % 2;
		coneball_index += 0.35;
		oldBall_index += 0.35;
		if (coneball_index >= sprite_get_number(coneball_sprite))
			coneball_index = frac(coneball_index);
		if (oldBall_index >= sprite_get_number(oldBall_sprite))
			oldBall_index = frac(oldBall_index);
		if (roll_index >= sprite_get_number(roll_sprite))
			roll_index = frac(roll_index);
		if (!get_panic())
			timer_y = approach(timer_y, 150, 4);
		else if (timer_in <= 0)
			timer_y = approach(timer_y, 0, 1);
	}
	else
	{
		if (oldBall_sprite == spr_timer_coneball_idle)
		{
			oldBall_sprite = spr_timer_coneball;
			oldBall_index = 0;
		}
		if (coneball_sprite == spr_bartimer_normalFront)
		{
			coneball_sprite = spr_bartimer_showtime;
			coneball_index = 0;
		}
		if (coneball_index < (sprite_get_number(coneball_sprite) - 1))
			coneball_index += 0.35;
		if (oldBall_index < (sprite_get_number(oldBall_sprite) - 1))
			oldBall_index += 0.35;
		if (oldTimer_index < (sprite_get_number(oldTimer_sprite) - 1))
			oldTimer_index += 0.35;
		if (timer_out > 0)
			timer_out--;
		else
			timer_y = approach(timer_y, 150, 1);
	}
	if (timer_in > 0)
		timer_in--;
}
else
{
	timer_y = 150;
	timer_out = 220;
	timer_in = 60;
	oldTimer_sprite = spr_timer;
	oldBall_sprite = spr_timer_coneball_idle;
	coneball_sprite = spr_bartimer_normalFront;
}
var tgtY = 1 - (global.combotime / 60);
if (global.combo == 0)
	tgtY = 1;
hand_y = lerp(hand_y, 54 * tgtY, 0.3);
if (global.combo != 0 && global.combotime > 0)
{
	switch (combo_state)
	{
		case 112:
			combo_vsp++;
			combo_y = approach(combo_y, 40, combo_vsp);
			if (combo_y >= 40)
				combo_state = 1;
			break;
		case 1:
			var pct = global.combotime / 60;
			var _shk = 2;
			var _t = 5;
			if (global.combotime < 30)
			{
				_shk = 3;
				_t = 1.1;
			}
			if (global.combotime < 15)
			{
				_shk = 2;
				_t = 0.15;
			}
			combo_y = lerp(combo_y, wave(-2, 2, 8, 3), 0.05);
			combo_x = wave(-_shk, _shk, _t, 5);
			break;
	}
	hand_x = approach(hand_x, combo_x, 5);
}
else
{
	combo_y = approach(combo_y, -200, 5);
	hand_x = approach(hand_x, 80, 5);
	combo_vsp = 0;
	combo_state = 112;
}
if (prompt_timer > 0 && !promptappear)
{
	promptalpha = approach(promptalpha, 1, 0.05);
	prompt_timer--;
}
else if (promptappear || prompt_timer <= 0)
{
	promptalpha = approach(promptalpha, 0, 0.05);
	if (promptalpha <= 0)
	{
		controlprompt = nexttext;
		promptappear = false;
	}
}
