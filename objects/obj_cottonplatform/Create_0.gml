canCollide = function(argument0 = obj_player)
{
	switch (argument0)
	{
		case obj_player:
		case obj_player2:
			var _state = global.freezeframe ? argument0.frozenstate : argument0.state;
			return (_state == states.cotton && argument0.state != states.cottondrill) || _state == states.cottonroll;
			break;
		default:
			return true;
			break;
	}
};
