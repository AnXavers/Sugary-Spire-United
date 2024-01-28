global.realtime = (current_second + ((current_minute + (current_hour * 60)) * 60))
cakeX = 0
if global.oldhud
	cakeX = 700
if (room == timesuproom || room == rank_room || room == rm_credits || room == rm_titlecard || global.levelname == "none" || global.levelname == "tutorial" || is_hub() || instance_exists(obj_bosscontroller))
	DrawHUD = 0;
else
	DrawHUD = 1;
if (global.conedowntime > -1 && !global.freezeframe && !instance_exists(obj_rank) && room != timesuproom && room != rank_room && room != rm_titlecard)
{
	global.conedowntime--
	if global.conedowntime == 0
	{
		with instance_create(obj_player.x, obj_player.y, obj_coneball)
		{
			if global.gamemode == 1
			{
				coneballtype = 1;
				sprite_index = obj_player.spr_coneball_melting_player
			}
		}
	}
}
if (!global.freezeframe && !instance_exists(obj_rank) && room != timesuproom && room != rank_room && room != rm_titlecard && global.gamemode == 1)
{
	if global.getawayfill > 0
		global.getawayfill--
	if instance_exists(obj_coneball)
	{
		with obj_coneball
		{
			if (global.getawayfill < 1)
			{
				coneballspeed = 1.6;
				sprite_index = obj_player.spr_coneball_player
			}
			else
			{
				coneballspeed = 1;
				sprite_index = obj_player.spr_coneball_melting_player
			}
		}
	}
}
if (get_panic() && !global.freezeframe && global.gamemode != 1)
{
	if (global.fill > global.maxwave)
		global.maxwave = global.fill;
	if (!global.freezeframe)
	{
		if (!obj_tv.sucroseTimer || obj_tv.target_fill >= global.fill && !instance_exists(obj_lowface))
			global.fill--;
		if (((global.fill > 0 && (global.fill % 60) == 0) || (global.fill <= 0 && (abs(global.fill) % 10) == 0)) && global.collect >= 5)
		{
			global.collect -= 5;
			with (instance_create(obj_player.x, obj_player.y, obj_pizzaloss))
				sprite_index = choose(spr_collect1, spr_collect2, spr_collect3, spr_collect4, spr_collect5);
			if obj_tv.sucroseTimer && !instance_exists(obj_yogurtexe) && !instance_exists(obj_coneball)
				scr_sound(sfx_countdown)
		}
	}
	if (global.panic && global.fill <= 0 && obj_tv.timer_out <= 0)
	{
		if (!instance_exists(obj_coneball) && room != timesuproom && global.conedowntime == -1)
			instance_create(obj_player.x, obj_player.y, obj_coneball);
		global.greyscalefade = approach(global.greyscalefade, 0.45, 0.005);
	}
	else
		global.greyscalefade = approach(global.greyscalefade, 0, 0.005);
	if (global.screentilt)
		camera_set_view_angle(view_camera[0], scr_sin(3.5 * clamp(global.wave / global.maxwave, 0, 1), 65 - (5 * clamp(global.wave / global.maxwave, 0, 1))));
	global.wave = clamp(clamp(global.wave + (60 / room_speed), 0, global.maxwave - global.fill), 0, global.maxwave);
	panicshake = clamp(lerp(1, 3, global.wave / global.maxwave), 1, 3);
	panicshakeacc = 3 / room_speed;
}
else
{
	panicshake = 0;
	panicshakeacc = 0;
	if (!global.freezeframe)
		camera_set_view_angle(view_camera[0], 0);
}
if (instance_exists(obj_lowface) && global.lowfacefill > 0)
{
	global.lowfacefill--
	lowfacetimery = lerp(lowfacetimery, global.cam_h, 0.05)
	if ((global.lowfacefill mod 60) == 0)
		scr_sound(sfx_blip)
}
else if !instance_exists(obj_lowface)
{
	global.lowfacefill = time_in_frames(0, 10)
	lowfacetimery = global.cam_h + 300
}
if (global.seconds < 0)
{
	global.seconds = 59;
	global.minutes--;
}
global.dancetimer = approach(global.dancetimer, 0, 1);
global.hitstunalarm = approach(global.hitstunalarm, -1, 1);
if (global.hitstunalarm <= 0)
	global.freezeframe = false;
if (frozen == 1 && global.freezeframe == 0)
{
	for (var i = 0; i < 3; i++)
		alarm_set(i, frozenalarm[i]);
	frozen = false;
}
if (!is_hub() && room != realtitlescreen && room != rm_introVideo && !instance_exists(obj_startgate) && room != palroom && room != rm_titlecard)
{
	if (!global.freezeframe && obj_player.state != 0 && obj_player.state != 18 && room != rank_room && !instance_exists(obj_endlevelfade))
	{
		global.playmiliseconds ++;
		if (global.playmiliseconds >= 60)
		{
			global.playmiliseconds = 0;
			global.playseconds ++;
			if (global.playseconds >= 60)
			{
				global.playseconds = 0;
				global.playminutes ++;
				if (global.playminutes >= 60)
				{
					global.playminutes = 0;
					global.playhour ++;
				}
			}
		}
	}
}
else
{
	global.playmiliseconds = 0;
	global.playseconds = 0;
	global.playminutes = 0;
	global.playhour = 0;
}
panicshake = approach(panicshake, 0, panicshakeacc);
if (shake_mag > 0 && !global.freezeframe)
{
	shake_mag -= shake_mag_acc;
	if (shake_mag < 0)
		shake_mag = 0;
}
var lspd = 0.25;
cam_angle = lerp(cam_angle, cam_langle, lspd);
cam_zoom = lerp(cam_zoom, cam_lzoom, lspd);
global.cam_zoom = lerp(global.cam_zoom, global.cam_targetzoom, lspd);
camera_set_view_angle(view_camera[0], cam_angle + camera_get_view_angle(view_camera[0]));
var vw = global.cam_w * cam_zoom * global.cam_zoom
var vh = global.cam_h * cam_zoom * global.cam_zoom
camera_set_view_size(view_camera[0], vw, vh);
if (instance_exists(obj_player) && !instance_exists(obj_editor) && (obj_player.state != states.timesup && obj_player.state != states.gameover))
{
	var target = 
	{
		x: global.targetCamX,
		y: global.targetCamY
	};
	var _cam_x = target.x - (vw / 2);
	var _cam_y = target.y - (vh / 2);
	var _shake_x = 0;
	var _shake_y = 0;
	if (!global.freezeframe)
	{
		var _targetcharge = 0;
		var _tspeed = 0;
		if (obj_player.state == states.mach2 || obj_player.state == states.mach3)
		{
			_targetcharge = obj_player.xscale * ((obj_player.movespeed / 4) * 50);
			_tspeed = 0.3;
			chargecamera = approach(chargecamera, _targetcharge, _tspeed);
		}
		else if (obj_player.state == states.climbceiling)
		{
			_targetcharge = -obj_player.xscale * ((obj_player.movespeed / 4) * 50);
			_tspeed = 0.3;
			chargecamera = approach(chargecamera, _targetcharge, _tspeed);
		}
		else if (abs(obj_player.hsp) >= 16 && obj_player.state != 12 && obj_player.state != 11 && obj_player.state != states.Sjump)
		{
			_targetcharge = sign(obj_player.hsp) * ((abs(obj_player.hsp) / 4) * 50);
			_tspeed = 2;
			if ((_targetcharge > 0 && chargecamera < 0) || (_targetcharge < 0 && chargecamera > 0))
				_tspeed = 8;
			chargecamera = approach(chargecamera, _targetcharge, _tspeed);
		}
		else if (obj_player.state == states.machslide)
			chargecamera = approach(chargecamera, 0, 10);
		else
			chargecamera = approach(chargecamera, 0, 6);
	}
	_cam_x += chargecamera;
	_cam_x = clamp(_cam_x, Camera_xorigin, Camera_width - vw);
	_cam_y = clamp(_cam_y, Camera_yorigin, Camera_height - vh);
	_cam_x = clamp(_cam_x, 0, room_width - vw);
	_cam_y = clamp(_cam_y, 0, room_height - vh);
	_shake_x += irandom_range(-panicshake, panicshake);
	_shake_y += irandom_range(-panicshake, panicshake);
	if (shake_mag != 0)
	{
		_shake_x += irandom_range(-shake_mag, shake_mag);
		_shake_y += irandom_range(-shake_mag, shake_mag);
	}
	lspd = 0.3;
	if (global.smoothcam == 1)
	{
		Cam_x = lerp(Cam_x, _cam_x, lspd);
		Cam_y = lerp(Cam_y, _cam_y, lspd);
	}
	else
	{
		Cam_x = _cam_x;
		Cam_y = _cam_y;
	}
	camera_set_view_pos(view_camera[0], Cam_x + _shake_x, Cam_y + _shake_y + irandom_range(-shake_mag, shake_mag));
}
else if instance_exists(obj_editor)
{
	Cam_x = obj_editor.x
	Cam_y = obj_editor.y
	camera_set_view_pos(view_camera[0], Cam_x, Cam_y);
}
if (obj_player.y < (180 + obj_camera.Cam_y) && obj_player.x < (350 + obj_camera.Cam_x))
	DrawY = lerp(DrawY, -300, 0.15);
else
	DrawY = lerp(DrawY, 0, 0.15);
Collectshake = approach(Collectshake, 0, 20 / room_speed);
if (global.collect < global.crank)
	global.currentrank = "D";
else if (global.collect < global.brank)
	global.currentrank = "C";
else if (global.collect < global.arank)
	global.currentrank = "B";
else if (global.collect < global.srank)
	global.currentrank = "A";
else if (global.collect >= global.srank)
{
	if (global.lapcount >= 10 && global.combolost == 0 && global.secretfound > 2 && global.treasure && global.hurtcounter < 1 && global.hasallconfecti)
		global.currentrank = "E";
	else if (global.combolost == 0 && global.secretfound > 2 && global.lapcount >= 2 && global.treasure)
		global.currentrank = "P";
	else
		global.currentrank = "S";
}
if (oldranklol != global.currentrank)
{
	bubblescale = 1.5;
	oldranklol = global.currentrank;
}
bubblescale = approach(bubblescale, 0, 0.1);
global.screenflash--;
audio_listener_position(camera_get_view_x(view_camera[0]) + (global.cam_w / 2), camera_get_view_y(view_camera[0]) + (global.cam_h / 2), 0);
if (painterdex < sprite_get_number(spr_painterhp))
	painterdex += 0.35;
else
	painterdex = 0;
if (pizdex < sprite_get_number(spr_pizzelle_hp))
	pizdex += 0.35;
else
	pizdex = 0;
if global.dogtimer > 0
{
	global.dogtimer++
	dogtimery = approach(dogtimery, 0, 3)
}
else
{
	dogtimery = approach(dogtimery, 200, 3)
}
switch (room)
{
	case devroom:
		window_set_caption("Developer's party in the Sugary Spire");
		break;
	case hub_basement:
		window_set_caption("The forgotten floor of the Sugary Spire");
		break;
	case hub_w1oldoldold:
	case hub_w1oldold:
	case hub_w1old:
	case hub_w1:
		window_set_caption("The main floor of the Sugary Spire");
		break;
	case hub_hallway:
		window_set_caption("Inside of the fabled Sugary Spire");
		break;
	case hub_w2old:
	case hub_w2:
		window_set_caption("The alienated floor of the Sugary Spire");
		break;
	case hub_w3:
		window_set_caption("The spooky floor of the Sugary Spire");
		break;
	case hub_top:
		window_set_caption("The final floor of the Sugary Spire");
		break;
	case entryway_1_custom:
	case entryway_1_new:
	case entryway_1_old:
	case entryway_1:
		window_set_caption("Construction underway at the Sugary Spire");
		break;
	case steamy_1_old:
	case steamy_1:
		window_set_caption("Downtown Sugary Spire");
		break;
	case molasses_1_old:
	case molasses_1:
		window_set_caption("Sugary Spire's natural habitat");
		break;
	case mine_1:
	case mineshaft_1:
	case mines_1_old:
	case mines_1:
		window_set_caption("Hard at work underneath the Sugary Spire");
		break;
	case rm_preinitializer:
	case rm_initializer:
	case rm_titlecard:
		window_set_caption("Loading the Sugary Spire");
		break;
	case rm_painterarena:
		window_set_caption("Artist's representation of the Sugary Spire");
		break;
	case rm_pizzanoarena:
		window_set_caption("Madman's thoughts on the Sugary Spire");
		break;
	case estate_1_new:
	case estate_1_old:
	case estate_1:
		window_set_caption("Property of the Sugary Spire");
		break;
	case mountain_intro_old:
	case mountain_intro:
		window_set_caption("Fudging it up inside of the Sugary Spire");
		break;
	case bee_1_old:
	case bee_1:
		window_set_caption("Buzzing cities within Sugary Spire");
		break;
	case finale_1:
		window_set_caption("At the end of the Sugary Spire");
		break;
	case sucrose_1:
		window_set_caption("Desolate Wastelands inside of the Sugary Spire");
		break;
	case silver_0:
	case silver_1:
	case silver_2:
	case silver_3:
	case silver_4:
		window_set_caption("The edge");
		break;
}
audio_listener_position(Cam_x, Cam_y, 0);
audio_listener_orientation(0, 0, 1, 0, -1, 0);