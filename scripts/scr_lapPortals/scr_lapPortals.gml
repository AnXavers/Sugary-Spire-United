function cutscene_lapPortal_start()
{
	var _finished = false;
	global.combofreeze = 30;
	with (obj_player)
	{
		state = 110;
		hsp = 0;
		vsp = 0;
		sprite_index = spr_lappingportal_enter;
		image_speed = 0.35;
		if (animation_end())
			_finished = true;
	}
	if (_finished)
	{
		if (room != sucrose_11 && obj_player.character == "P")
			obj_music.escapemusic = mu_lap;
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
		state = 110;
		hsp = 0;
		vsp = 0;
		sprite_index = spr_bodyslamfall;
		image_speed = 0.35;
		if (!instance_exists(obj_fadeout))
		{
			if (!instance_exists(_portal))
				_portal = instance_create(x, y + 14, obj_lapPortalexit);
			else
			{
				visible = true;
				if (floor(_portal.image_index) >= 4)
					_finished = true;
			}
		}
	}
	if (_finished)
		cutscene_event_end();
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
		sprite_index = spr_bodyslamfall;
		state = 74;
		_finished = true;
	}
	if (_finished)
	{
		instance_create(0, 0, obj_lap2visual);
		cutscene_event_end();
	}
}
