canCollide = function(argument0 = obj_player)
{
	switch (argument0)
	{
		case obj_player:
		case obj_player2:
			var _state = global.freezeframe ? argument0.frozenstate : argument0.state;
			return _state != states.seacreamjump && _state != states.seacreamstick && _state != states.seacream;
			break;
		default:
			return true;
			break;
	}
};
