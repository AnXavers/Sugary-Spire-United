canCollide = function(argument0 = obj_player)
{
	switch (argument0)
	{
		case obj_player:
		case obj_player2:
			var _state = global.freezeframe ? argument0.frozenstate : argument0.state;
			return (_state == 144 || (_state == 145 && argument0.vsp > 0)) && abs(argument0.hsp) >= 12 && !place_meeting(x, y, argument0);
			break;
		default:
			return false;
			break;
	}
};
