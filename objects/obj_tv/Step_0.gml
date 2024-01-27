scr_tvsprites();
if (!visible)
	sprite_index = spr_tvoff;
if (!(obj_player.state == states.knightpep && obj_player.state == states.knightpepattack && obj_player.state == states.knightpepslopes))
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
var _sstvx = sstvx + sstvhsp
var _sstvy = sstvx + sstvvsp
if (_sstvx < sprite_get_bbox_left(tvspr) || _sstvx > sprite_get_bbox_right(tvspr))
{
	sstvhsp = -sstvhsp
	sstvx += sstvhsp
}
if (_sstvy < sprite_get_bbox_top(tvspr) || _sstvy > sprite_get_bbox_bottom(tvspr))
{
	sstvvsp = -sstvvsp
	sstvy += sstvvsp
}
if (global.hurtcounter >= global.hurtmilestone && global.hurtcounter >= 5)
{
	showtext = 1;
	global.hurtmilestone += 5;
	var character = "Pizzelle";
	switch obj_player.character
	{
		case "N":
			character = "Pizzano";
			break;
		case "G":
			character = "Gumbob";
			break;
		case "C":
			character = "Coneboy";
			break;
		case "T":
			character = "The Noise";
			break;
				case "PT":
			character = "The Noise";
			break;
		case "S":
			character = "Peppino";
			break;
		case "V":
			character = "The Vigilante";
			break;
		case "M":
			character = "Pepperman";
			break;
		case "Z":
			character = "Pizzall";
			break;
		case "RM":
			character = "Rosette and Marble";
			break;
		case "GB":
			character = "Gustavo and Brick";
			break;
	}
	scr_controlprompt("[spr_promptfont]You have hurt " + string(character) + " " + string(global.hurtmilestone) + " times...");
	if !global.oldhud
		scr_queue_tvanim(hurttext1tvspr, 100);
}
if (obj_player.state == states.keyget)
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
	case states.normal:
		if instance_exists(obj_secretfound)
		{
			idlespr = secrettvspr;
		}
		else
		{
			idlespr = idletvspr;
			if (obj_player.angry)
				idlespr = angrytvspr;
			if (global.panic)
				idlespr = panictvspr;
			if (global.lapmode == 2)
			{
				if global.lapcount >= 5
					idlespr = spr_pizzelletv_fear
				else if (global.lapcount >= 4)
					idlespr = lap4tvspr;
				else if (global.lapcount >= 3)
					idlespr = lap3tvspr;
			}
			else if (global.lapcount >= 5)
				idlespr = laptvspr;
			with (obj_gummyharry)
			{
				if (obj_player.character == "N" && distance_to_object(obj_player) < 400 && (!global.panic))
					other.idlespr = spr_pizzanotv_harry
			}
		}
		var _transfo = true;
		switch (allstate)
		{
			case states.mach1:
			case states.mach2:
			case states.handstandjump:
			case states.machslide:
			case states.climbwall:
			case states.machroll:
			case states.crouchslide:
			case states.mach3:
				_transfo = false;
				var my_mvsp = global.freezeframe ? abs(obj_player.frozenhsp) : abs(obj_player.hsp);
				if (allstate == states.climbwall)
					my_mvsp = global.freezeframe ? abs(obj_player.frozenvsp) : abs(obj_player.vsp);
				idlespr = mach1tvspr;
				if (my_mvsp >= 8 || allstate == states.handstandjump)
					idlespr = mach2tvspr;
				if (my_mvsp >= 12 || allstate == states.mach3)
					idlespr = mach3tvspr;
				if (my_mvsp >= 20 || obj_player.sprite_index == obj_player.spr_crazyrun)
					idlespr = mach4tvspr;
				if (allstate == states.handstandjump || allstate == states.crouchslide)
					idlespr = mach1tvspr;
				if (allstate == states.machroll)
					idlespr = machrolltvspr;
				break;
			case states.hooks:
				idlespr = hooktvspr;
				break;
			case states.minecart:
				idlespr = minecarttvspr;
				break;
			case states.fireass:
				idlespr = firetvspr;
				break;
			case states.bombpep:
				idlespr = bombtvspr;
				break;
			case states.cotton:
			case states.cottondrill:
			case states.cottonroll:
			case states.cottonspring:
				idlespr = cottontvspr;
				break;
			case states.rupertnormal:
			case states.rupertjump:
			case states.rupertslide:
			case states.rupertstick:
			case states.frostburn:
			case states.frostburnbump:
			case states.frostburnspin:
			case states.frostburnwallrun:
				idlespr = frostburntvspr;
				break;
			case states.fling:
				idlespr = orbtvspr;
				break;
			case states.ufofloat:
			case states.ufodash:
			case states.ufodashOLD:
				idlespr = ufotvspr;
				break;
			case states.cookiemount:
			case states.cookiemountattack:
			case states.cookiemountfireass:
				idlespr = marshdogspr;
				break;
			default:
				_transfo = false;
				break;
		}
		if (obj_player.sprite_index == obj_player.spr_mach3hitwall || obj_player.sprite_index == obj_player.spr_freefallland || obj_player.sprite_index == obj_player.spr_ceilingcrash || allstate = states.squished)
			idlespr = crashtvspr;
		if (!_transfo)
		{
			if (allstate == states.hurt)
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
					idleanim = choose(400, 450, 500, 550);
				}
				break;
		}
		if (saved_tv_spr != idlespr && !draw_static && !global.freezeframe)
		{
			saved_tv_spr = idlespr;
			draw_static = true;
			state = states.tv_transition;
			static_index = 0;
		}
		break;
	case states.tv_transition:
		draw_static = true;
		saved_tv_spr = idlespr;
		if (floor(static_index) >= 4 || global.oldhud)
		{
			if (expressionsprite != -4)
			{
				state = states.tv_expression;
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
	case states.tv_expression:
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
			state = states.tv_transition;
			expressionsprite = -4;
			draw_static = true;
			static_index = 0;
		}
		break;
}
if (textbubblesprites == spr_tv_bubbleopen && floor(textbubbleframes) >= (sprite_get_number(spr_tv_bubbleopen) - 1))
	textbubblesprites = spr_tv_bubble;
if (textbubblesprites == spr_tv_bubble)
	text_x -= 1.5;
if (textbubblesprites == spr_tv_bubbleclose && floor(textbubbleframes) >= (sprite_get_number(spr_tv_bubbleclose) - 1))
{
	if new_message[1] != ""
	{
		array_delete(new_message, 0, 1)
		array_push(new_message, "")
		shownewtext = true;
		textbubblesprites = spr_tv_bubbleclosed
	}
	else
	{
		new_message = ["", ""];
		shownewtext = false;
		textbubblesprites = spr_null
	}
	showingnewtext = false;
	textbubbleframes = 0;
	text_x = 300;
}
switch (obj_player.state)
{
	case states.cotton:
	case states.cottondrill:
	case states.cottonroll:
		if (ds_list_find_index(global.saveroom, "cotton") == -1)
		{
			scr_queue_text("Mmmph!! MMMPH!! MMPPH! (This cotton is quite a delicacy, isn't it?)")
			ds_list_add(global.saveroom, "cotton");
		}
		break;
	case states.minecart:
		if (ds_list_find_index(global.saveroom, "minecart") == -1)
		{
			scr_queue_text("Easy... easy... hold on to your hats... hard hats, rather.")
			ds_list_add(global.saveroom, "minecart");
		}
		break;
	case states.fireass:
		if (ds_list_find_index(global.saveroom, "fireass") == -1)
		{
			scr_queue_text(["Breaking news... local candy maker finds himself burned by caramel.", "What an idiot. How does that even happen?"]);
			ds_list_add(global.saveroom, "fireass");
		}
		break;
	case states.fling:
		if (ds_list_find_index(global.saveroom, "fling") == -1)
		{
			scr_queue_text("Aughh!! What kind of black magic has this flying frog casted upon me?! Feels kinda nice.");
			ds_list_add(global.saveroom, "fling");
		}
		break;
	case states.flushed:
		if (ds_list_find_index(global.saveroom, "flushed") == -1)
		{
			scr_queue_text("Incredibly cold temperatures are causing random individuals to be frozen solid. We recommend you stay inside during these chilly times.");
			ds_list_add(global.saveroom, "flushed");
		}
		break;
	case states.frostburn:
	case states.frostburnbump:
	case states.frostburnspin:
	case states.frostburnwallrun:
	case states.rupertjump:
	case states.rupertnormal:
	case states.rupertslide:
	case states.rupertstick:
		if (ds_list_find_index(global.saveroom, "rupert") == -1)
		{
			scr_queue_text("Is... is it... cold in here... or is it just me?");
			ds_list_add(global.saveroom, "rupert");
		}
		break;
	case states.candy_dash:
	case states.candy_normal:
	case states.candy_pinball:
		if (ds_list_find_index(global.saveroom, "candy") == -1)
		{
			scr_queue_text("This is the candy transformation text");
			ds_list_add(global.saveroom, "candy");
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
		if (oldBall_sprite == spr_timeryogurt_idle)
		{
			oldBall_sprite = spr_timeryogurt_agr
			oldBall_index = 0
		}
		if (oldBall_sprite == spr_timeryogurt_agr)
			timer_out = 999
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
frameref++
if textbubblesprites != spr_null
	textbubbleframes += 0.35