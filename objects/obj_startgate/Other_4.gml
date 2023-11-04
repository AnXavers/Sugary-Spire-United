ini_open(global.fileselect);
var _confectispr = [
	[obj_player.spr_confecti1_idle, obj_player.spr_confecti1_walk, obj_player.spr_confecti1_taunt, -75],
	[obj_player.spr_confecti2_idle, obj_player.spr_confecti2_walk, obj_player.spr_confecti2_taunt, -35],
	[obj_player.spr_confecti3_idle, obj_player.spr_confecti3_walk, obj_player.spr_confecti3_taunt, 0],
	[obj_player.spr_confecti4_idle, obj_player.spr_confecti4_walk, obj_player.spr_confecti4_taunt, 35],
	[obj_player.spr_confecti5_idle, obj_player.spr_confecti5_walk, obj_player.spr_confecti5_taunt, 75]
];
confecti[0] = ini_read_real("Confecti", string(level) + "1", 0);
confecti[1] = ini_read_real("Confecti", string(level) + "2", 0);
confecti[2] = ini_read_real("Confecti", string(level) + "3", 0);
confecti[3] = ini_read_real("Confecti", string(level) + "4", 0);
confecti[4] = ini_read_real("Confecti", string(level) + "5", 0);
for (var i = 0; i < array_length(_confectispr); i++)
{
	var b = _confectispr[i];
	if (confecti[i])
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
with instance_create(x, y, obj_gatesecret)
{
	cardtimer = 750;
	cardspr = (ini_read_string("Secret", string(obj_startgate.level), 0) >= 1 ? spr_rankcardflipped : spr_rankcard);
	dorigin = other.depth
}
with instance_create(x, y, obj_gatesecret)
{
	cardtimer = 0;
	cardspr = (ini_read_string("Secret", string(obj_startgate.level), 0) >= 2 ? spr_rankcardflipped : spr_rankcard);
	dorigin = other.depth
}
with instance_create(x, y, obj_gatesecret)
{
	cardtimer = -750;
	cardspr = (ini_read_string("Secret", string(obj_startgate.level), 0) >= 3 ? spr_rankcardflipped : spr_rankcard);
	dorigin = other.depth
}
var i = 0;
var _string_length = string_length(ini_read_string("Highscore", string(level), 0)) + 1;
for (i = 0; i < _string_length; i++)
	colors[i] = irandom(6);
ini_close();