if (room == timesuproom || room == rank_room || room == rm_credits || room == rm_titlecard || room == hub_w1 || room == hub_w2 || room == tutorial_1 || instance_exists(obj_bosscontroller))
	DrawHUD = 0;
else
	DrawHUD = 1;
if (get_panic() && !global.freezeframe)
{
	if (global.fill > global.maxwave)
		global.maxwave = global.fill;
	if (!global.freezeframe)
	{
		if (!obj_tv.sucroseTimer || obj_tv.target_fill >= global.fill)
			global.fill--;
		if (((global.fill > 0 && (global.fill % 60) == 0) || (global.fill <= 0 && (abs(global.fill) % 10) == 0)) && global.collect >= 5)
		{
			global.collect -= 5;
			with (instance_create(obj_player.x, obj_player.y, obj_pizzaloss))
				sprite_index = choose(spr_collect1, spr_collect2, spr_collect3, spr_collect4, spr_collect5);
		}
	}
	if (global.panic && global.fill <= 0 && obj_tv.timer_out <= 0)
	{
		if (!instance_exists(obj_coneball) && room != timesuproom)
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
if (global.seconds < 0)
{
	global.seconds = 59;
	global.minutes -= 1;
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
if (room != realtitlescreen && room != rm_introVideo && !instance_exists(obj_startgate) && room != scootercutsceneidk && room != outer_room1 && room != outer_room2 && room != hub_w1 && room != hub_w2 && room != palroom && room != rm_titlecard)
{
	if (!global.freezeframe && obj_player.state != 0 && obj_player.state != 18 && room != rank_room && !instance_exists(obj_endlevelfade))
	{
		global.playmiliseconds += 1;
		if (global.playmiliseconds >= 60)
		{
			global.playmiliseconds = 0;
			global.playseconds += 1;
			if (global.playseconds >= 60)
			{
				global.playseconds = 0;
				global.playminutes += 1;
				if (global.playminutes >= 60)
				{
					global.playminutes = 0;
					global.playhour += 1;
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
camera_set_view_angle(view_camera[0], cam_angle + camera_get_view_angle(view_camera[0]));
var vw = cam_w * cam_zoom;
var vh = cam_h * cam_zoom;
camera_set_view_size(view_camera[0], vw, vh);
if (instance_exists(obj_player) && (obj_player.state != 30 && obj_player.state != 51))
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
		var _player = obj_player;
		var _targetcharge = 0;
		var _tspeed = 0;
		if (_player.state == 69 || _player.state == 70)
		{
			_targetcharge = _player.xscale * ((_player.movespeed / 4) * 50);
			_tspeed = 0.3;
			chargecamera = approach(chargecamera, _targetcharge, _tspeed);
		}
		else if (_player.state == 139)
		{
			_targetcharge = -_player.xscale * ((_player.movespeed / 4) * 50);
			_tspeed = 0.3;
			chargecamera = approach(chargecamera, _targetcharge, _tspeed);
		}
		else if (abs(_player.hsp) >= 16 && _player.state != 12 && _player.state != 11 && _player.state != 63)
		{
			_targetcharge = sign(_player.hsp) * ((abs(_player.hsp) / 4) * 50);
			_tspeed = 2;
			if ((_targetcharge > 0 && chargecamera < 0) || (_targetcharge < 0 && chargecamera > 0))
				_tspeed = 8;
			chargecamera = approach(chargecamera, _targetcharge, _tspeed);
		}
		else if (_player.state == 71)
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
	if (global.combolost == 0 && global.secretfound > 2 && global.lapcount >= 1 && global.treasure)
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
global.screenflash -= 1;
audio_listener_position(camera_get_view_x(view_camera[0]) + (cam_w / 2), camera_get_view_y(view_camera[0]) + (cam_h / 2), 0);
if (painterdex < sprite_get_number(spr_painterhp))
	painterdex += 0.35;
else
	painterdex = 0;
if (pizdex < sprite_get_number(spr_pizzellehp))
	pizdex += 0.35;
else
	pizdex = 0;
switch (room)
{
	case devroom:
		window_set_caption("Developer's party in the Sugary Spire");
		break;
	case hub_w1:
		window_set_caption("Inside of the fabled Sugary Spire");
		break;
	case hub_w2:
		window_set_caption("The alienated floor of the Sugary Spire");
		break;
	case entryway_1:
		window_set_caption("Construction underway at the Sugary Spire");
		break;
	case steamy_1:
		window_set_caption("Downtown Sugary Spire");
		break;
	case molasses_1:
		window_set_caption("Sugary Spire's natural habitat");
		break;
	case mines_1:
		window_set_caption("Hard at work underneath the Sugary Spire");
		break;
	case rm_titlecard:
		window_set_caption("Loading the Sugary Spire");
		break;
	case rm_painterarena:
		window_set_caption("Artist's representation of the Sugary Spire");
		break;
	case estate_1:
		window_set_caption("Property of the Sugary Spire");
		break;
}
audio_listener_position(Cam_x, Cam_y, 0);
audio_listener_orientation(0, 0, 1, 0, -1, 0);
