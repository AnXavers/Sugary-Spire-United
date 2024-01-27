lap_out = 0;
lap_x = 0;
lap_y = 0;
goo_index = 0;
goo_surface = surface_create(100, 180);
surface_set_target(goo_surface);
draw_clear_alpha(0, 0);
surface_reset_target();
tvbg_surface = surface_create(278, 268);
surface_set_target(tvbg_surface);
draw_clear_alpha(0, 0);
surface_reset_target();
image_speed = 0.35;
message = "";
comboAnim = false;
showtext = 0;
tvsprite = spr_tvoff;
noisesprite = spr_rosette;
xi = 500;
idleanim = 0;
yi = 600;
imageindexstore = 0;
chooseOnecomboend = true;
ComboShake = false;
comboendImage = 0;
comboendSprite = spr_badcombo_boil;
combocanFade = true;
once = 0;
frameref = 0;
global.hurtcounter = 0;
global.hurtmilestone = 0;
global.mallowfollow = 0;
global.crackfollow = 0;
alpha = 1;
global.challengemode = 0;
shownranka = 0;
shownrankb = 0;
shownrankc = 0;
global.erank = 0;
global.srank = 0;
global.arank = 0;
global.brank = 0;
global.crank = 0;
character = "PIZZELLE";
BarSurface = -4;
BarX = 0;
tvcount = 500;
draw_combo = 0;
combofade = 0;
invsprite = spr_invempty;
staticdraw = 0;
statictimer = 20;
Channelstate = 0;
OLDChannelstate = 0;
state = 1;
expressiontime = 0;
playComboVariable = 0;
draw_static = 0;
static_index = 0;
idlespr = -4;
saved_tv_spr = -4;
expressionsprite = -4;
playerstate = obj_player.state;
supermario = 0;
tvlength = 0;
propindex = 0;
statindex = 0;
bobbing = 0;
textbubblesprites = spr_null;
textbubbleframes = 0;
textpromptsurface = -4;
shownewtext = false;
showingnewtext = false;
text_x = 300;
new_message = ["", ""];
global.newhudtvanim = ds_queue_create();
global.newhudmessage = ds_queue_create();
alarm[1] = 1;
DrawY = 0;
voice1 = sfx_combovoice1p;
voice2 = sfx_combovoice2p;
voice3 = sfx_combovoice3p;
voice4 = sfx_combovoice4p;
voice5 = sfx_combovoice5p;
voice6 = sfx_combovoice6p;
voice7 = sfx_combovoice7p;
voice8 = sfx_combovoice8p;
function scr_combotext(argument0 = global.combo)
{
	var sprite = spr_badcombo_intro;
	if (argument0 <= 5)
	{
		sprite = spr_badcombo_intro;
		if (chance(0.25))
			scr_dialogue(voice1);
	}
	else if (argument0 <= 10)
	{
		sprite = spr_sourcombo_intro;
		if (chance(0.5))
			scr_dialogue(voice2);
	}
	else if (argument0 <= 15)
	{
		sprite = spr_okcombo_intro;
		if (chance(0.75))
			scr_dialogue(voice3);
	}
	else if (argument0 <= 20)
	{
		sprite = spr_alrightcombo_intro;
		if (chance(0.85))
			scr_dialogue(voice4);
	}
	else if (argument0 <= 25)
	{
		sprite = spr_sweetcombo_intro;
		scr_dialogue(voice5);
	}
	else if (argument0 <= 30)
	{
		sprite = spr_spicycombo_intro;
		scr_dialogue(voice6);
	}
	else if (argument0 <= 35)
	{
		sprite = spr_ruthlesscombo_intro;
		scr_dialogue(voice7);
	}
	else
	{
		sprite = spr_wtfcombo_intro;
		scr_dialogue(voice8);
	}
	global.combolost = 1;
	return sprite;
}
timer_index = 0;
timer_sprite = spr_timer;
coneball_index = 0;
coneball_sprite = spr_timer_coneball_idle;
timer_out = 180;
timer_in = 180;
timer_y = 100;
roll_index = 0;
roll_sprite = spr_bartimer_roll;
bartimer_x = 0;
target_fill = 0;
sucroseTimer = false;
oldTimer_sprite = spr_timer;
oldBall_sprite = spr_timer_coneball_idle;
oldBall_index = 0;
oldTimer_index = 0;
combo_state = 112;
hand_y = 0;
hand_x = 0;
combo_x = 0;
combo_y = 0;
combo_vsp = 0;
controlprompt = "Placeholder Prompt Text";
promptalpha = 0;
nexttext = "Sex";
promptappear = false;
promptappeared = false;
prompt_timer = 0;
bg_details =
[
	[spr_entry_startgate, 5, 0, 0],
	[spr_entry_startgate, 4, 1, 0.15],
	[spr_entry_startgate, 3, 2, 0.35],
	[spr_entry_startgate, 2, 0, 0.5]
]
hscroll = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
DrawX = 0;
OldDrawY = 0;
checkpointspr = spr_checkpointflag_unvisit
checkpointalpha = 0
checkpointindex = 0
sstvhsp = choose(0.5, -0.5)
sstvvsp = choose(0.5, -0.5)
sstvx = 139
sstvy = 134