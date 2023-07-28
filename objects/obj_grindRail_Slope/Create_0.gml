depth = 4;
canCollide = function(argument0 = obj_player)
{
	switch (argument0)
	{
		case obj_player:
		case obj_player2:
			var _state = global.freezeframe ? argument0.frozenstate : argument0.state;
			return _state != states.noclip && _state != states.cotton && _state != states.cottondrill && _state != states.cottonroll && _state != states.tumble && _state != states.machroll && _state != states.frostburnbump && _state != states.crouchslide && _state != states.backbreaker && _state != states.bump && _state != states.actor && _state != states.frozen;
			break;
		case obj_creamThief:
			return true;
			break;
		default:
			return false;
			break;
	}
};
