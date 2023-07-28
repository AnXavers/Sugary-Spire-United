canCollide = function(argument0 = obj_player)
{
	switch (argument0)
	{
		case obj_player:
		case obj_player2:
			var _state = global.freezeframe ? argument0.frozenstate : argument0.state;
			return (_state == 88 && argument0.state != 97) || _state == 98;
			break;
		default:
			return true;
			break;
	}
};
