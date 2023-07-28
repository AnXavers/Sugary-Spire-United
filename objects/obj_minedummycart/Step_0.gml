hsp = sign(image_xscale) * movespeed;
if (Dashpad_buffer > 0)
	Dashpad_buffer = max(Dashpad_buffer - 1, 0);
var _player = instance_nearest(x, y, obj_player);
if (sprite_index == spr_minecart)
{
	if (place_meeting(x, y - 4, _player) && _player.vsp > 0 && _player.state != states.minecart)
	{
		_player.state = states.minecart;
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
		instance_destroy(id, false);
	}
}
if (grounded && !place_meeting(x, y + 1, obj_minecartRail) && !place_meeting(x, y + 1, obj_minecartRail_Slope))
	movespeed = approach(movespeed, 0, 0.45);
if (movespeed <= 0 && sprite_index != spr_minecartend)
{
	image_index = 0;
	sprite_index = spr_minecartend;
}
