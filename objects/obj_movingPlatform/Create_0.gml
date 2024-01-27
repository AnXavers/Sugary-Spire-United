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
hsp = 0;
vsp = 0;
stopped = false;
stopid = -4;
stopSpeed = 0;
stopSpeedMax = 4;
stopSpeedAcc = 0.5;
stopSpeedDecc = 0.5;
platformDirection = targetDirection;
TrueX = x;
TrueY = y;
oldx = xstart;
oldy = ystart;
