activationCode = function()
{
	return place_meeting(x, y, obj_player) && obj_player.state != states.hooks;
};
