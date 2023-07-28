activationCode = function()
{
	var _player = instance_nearest(x, y, obj_player);
	return place_meeting(x, y, _player) && _player.state != 126;
};
