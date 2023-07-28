depth = 4;
canCollide = function(argument0 = obj_player)
{
	switch (argument0)
	{
		case obj_player:
		case obj_player2:
			var _state = global.freezeframe ? argument0.frozenstate : argument0.state;
			return _state == states.minecart;
			break;
		case obj_minecart:
		case obj_minedummycart:
		case obj_train:
			return true;
			break;
		default:
			return false;
			break;
	}
};
