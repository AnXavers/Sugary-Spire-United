var _player = instance_nearest(x, y, obj_player);
if (place_meeting(x, y - 4, _player) && !place_meeting(x, y, obj_minedummycart) && _player.state != 101)
{
	grabbedMinecart = true;
	global.combofreeze = 30;
	_player.state = 101;
	if (_player.xscale == image_xscale)
		_player.movespeed = clamp(_player.movespeed, 3, 12);
	else
		_player.movespeed = clamp(_player.movespeed / 4, 3, 12);
	_player.vsp = vsp;
	_player.sprite_index = spr_player_minecart;
	_player.x = x;
	_player.y = y;
	_player.xscale = image_xscale;
	if (!instance_exists(obj_poofeffect))
		instance_create(x, y, obj_poofeffect);
	var myButton1 = get_control_string(global.key_jump);
	scr_controlprompt("[spr_buttonfont]" + myButton1 + "[spr_promptfont] Jump" + "[spr_buttonfont]" + myButton1 + "[spr_promptfont] Dismount Minecart (In Air)");
}
if (_player.state == 101 || place_meeting(x, y, obj_minedummycart))
	image_alpha = 0.5;
else
	image_alpha = 1;
