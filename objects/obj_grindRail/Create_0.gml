depth = 4;
canCollide = function(argument0 = obj_player)
{
	switch (argument0)
	{
		case obj_player:
		case obj_player2:
			var _state = global.freezeframe ? argument0.frozenstate : argument0.state;
			return _state != 128 && _state != 88 && _state != 97 && _state != 98 && _state != 96 && _state != 31 && _state != 143 && _state != 67 && _state != 45 && _state != 72 && _state != 110 && _state != 0;
			break;
		case obj_creamThief:
			return true;
			break;
		default:
			return false;
			break;
	}
};
