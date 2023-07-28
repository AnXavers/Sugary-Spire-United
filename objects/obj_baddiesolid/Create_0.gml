canCollide = function(argument0 = obj_player)
{
	switch (argument0)
	{
		case obj_player:
		case obj_player2:
		case obj_painter:
			return true;
			break;
		default:
			return false;
			break;
	}
};
