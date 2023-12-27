ini_open(global.fileselect);
showinfo = ini_read_string("Ranks", string(level), "none") != "none" ? true : false;
ini_close();
if showinfo
{
	ini_open(global.fileselect);
	if do_gateconfecti
	{
		var _confectispr = [
			[obj_player.spr_confecti1_idle, obj_player.spr_confecti1_walk, obj_player.spr_confecti1_taunt, -75],
			[obj_player.spr_confecti2_idle, obj_player.spr_confecti2_walk, obj_player.spr_confecti2_taunt, -35],
			[obj_player.spr_confecti3_idle, obj_player.spr_confecti3_walk, obj_player.spr_confecti3_taunt, 0],
			[obj_player.spr_confecti4_idle, obj_player.spr_confecti4_walk, obj_player.spr_confecti4_taunt, 35],
			[obj_player.spr_confecti5_idle, obj_player.spr_confecti5_walk, obj_player.spr_confecti5_taunt, 75]
		];
		for (var i = 0; i < array_length(_confectispr); i++)
		{
			var b = _confectispr[i];
			if ini_read_real("Confecti", string(level) + string((i + 1)), 0)
			{
				with (instance_create(x + b[3], y - 46, obj_confectiprop))
				{
					tauntspr = b[2];
					movespr = b[1];
					idlespr = b[0];
					depth = other.depth - 5
					if (place_meeting(x, y, obj_platform))
						y -= 2;
				}
			}
		}
	}
	if do_gatesecrets
	{
		for (var i = 0; i < 3; i++)
		{
			with instance_create(x, y, obj_gatesecret)
			{
				cardtimer = ((i * -750) + 750);
				cardspr = (ini_read_string("Secret", string(obj_startgate.level), 0) >= (i + 1) ? spr_rankcardflipped : spr_rankcard);
				dorigin = other.depth
			}
		}
	}
	var i = 0;
	var _string_length = string_length(ini_read_string("Highscore", string(level), 0)) + 1;
	for (i = 0; i < _string_length; i++)
		colors[i] = irandom(6);
	ini_close();
}
if (global.entergateid == id)
{
	with instance_create(x - 16, y - 32, obj_doortrigger_parent)
		id_door = "SG"
	obj_player.targetDoor = "SG"
	global.entergateid = inst_6BB1D575
}