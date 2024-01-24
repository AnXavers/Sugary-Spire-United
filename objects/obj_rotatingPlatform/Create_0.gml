canCollide = function(argument0 = obj_player)
{
	switch (argument0)
	{
		case obj_player:
		case obj_player2:
			var _state = global.freezeframe ? argument0.frozenstate : argument0.state;
			return _state != states.ladder;
			break;
		default:
			return true;
			break;
	}
};
depth = 5;
image_speed = 0.35;
image_blend = c_yellow;
oldx = xstart;
oldy = ystart;
