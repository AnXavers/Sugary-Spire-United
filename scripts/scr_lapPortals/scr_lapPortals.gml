function cutscene_lapPortal_start()
{
	var _finished = false;
	global.combofreeze = 30;
	with (obj_player)
	{
		state = states.actor;
		hsp = 0;
		vsp = 0;
		sprite_index = spr_lapportal_enter;
		image_speed = 0.35;
		if (animation_end())
			_finished = true;
	}
	if (_finished)
	{
		if (room != sucrose_11 && obj_player.character == "P")
			obj_music.escapemusic = mu_pizzelle_lap;
		global.lapcount++;
		global.collect += 3000;
		global.combotime = 60;
		var time = scr_laptimes();
		show_debug_message(string(time[0]) + ":" + string(time[1]));
		for (var i = 0; i < ds_list_size(global.escaperoom); i++)
		{
			var b = ds_list_find_value(global.escaperoom, i);
			var q = ds_list_find_index(global.baddieroom, b);
			var t = 0;
			if (q == -1)
			{
				q = ds_list_find_index(global.saveroom, b);
				t = 1;
			}
			if (q != -1)
			{
				if (!t)
					ds_list_delete(global.baddieroom, q);
				else
					ds_list_delete(global.saveroom, q);
			}
		}
		ds_list_clear(global.escaperoom);
		if (!instance_exists(obj_fadeout))
		{
			scr_sound(sound_door);
			instance_create(0, 0, obj_fadeout);
		}
		global.maintainzoom = 1;
		cutscene_event_end();
	}
}
function cutscene_lapPortal_middle()
{
	static _portal = -4;
	var _finished = false;
	global.combofreeze = 30;
	with (obj_player)
	{
		visible = false;
		state = states.actor;
		hsp = 0;
		vsp = 0;
		sprite_index = spr_pizzelle_groundpound;
		image_speed = 0.35;
		if (!instance_exists(obj_fadeout))
		{
			if (!instance_exists(_portal))
				_portal = instance_create(x, y + 14, obj_lapPortalexit);
			else
			{
				visible = true;
				obj_player.visible = false;
				if (floor(_portal.image_index) >= 16)
					_finished = true;
			}
		}
	}
	if (_finished)
	{
		cutscene_event_end();
		obj_player.visible = true;
		instance_destroy(obj_cameraRegion)
		global.maintainzoom = 0;
	}
}
function cutscene_lapPortal_end()
{
	var _finished = false;
	global.combofreeze = 30;
	with (obj_player)
	{
		hsp = 0;
		vsp = 0;
		movespeed = 0;
		sprite_index = spr_pizzelle_groundpound;
		state = states.freefall;
		_finished = true;
	}
	if (_finished)
	{
		instance_create(0, 0, obj_lap2visual);
		cutscene_event_end();
	}
}
function cutscene_harryFreeze()
{
	global.combofreeze = 30;
	global.harryfxval = lerp(global.harryfxval, 0.6, 0.05)
	fx_set_parameter(global.harryfx, "g_TintCol", [global.harryfxval, global.harryfxval, global.harryfxval, 1])
	with obj_camera
	{
		freezetype = 0
		event_user(0)
	}
	with (obj_harrydead)
	{
		depth = -2
		hsp = 0;
		vsp = 0;
		x = horigin + random_range(-1, 1)
		grav = 0;
		if image_xscale
			hudx = lerp(hudx, global.cam_w - 100, 0.05)
		else
			hudx = lerp(hudx, 100, 0.05)
	}
	with (obj_player)
	{
		state = states.actor;
		hsp = 0;
		vsp = 0;
		image_speed = 0;
	}
	if instance_exists(obj_coneball)
	{
		obj_coneball.hspeed = 0;
		obj_coneball.vspeed = 0;
	}
	if (instance_exists(obj_harrydead) && obj_harrydead.alarm[1] <= 1)
	{
		cutscene_event_end();
		obj_player.hsp = obj_harrydead.freezehsp
		obj_player.vsp = obj_harrydead.freezevsp
		obj_player.state = obj_harrydead.freezestate
		obj_player.image_speed = 0.35
		if instance_exists(obj_coneball)
		{
			obj_coneball.hspeed = obj_harrydead.coneballhsp
			obj_coneball.vspeed = obj_harrydead.coneballvsp
			obj_coneball.image_speed = 0.35
		}
	}
}
