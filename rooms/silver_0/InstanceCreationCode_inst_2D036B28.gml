flags.do_save = false;
flags.do_once = false;
condition = function()
{
	return place_meeting(x, y, obj_player);
};
output = function()
{
	obj_player.x -= 96
};
