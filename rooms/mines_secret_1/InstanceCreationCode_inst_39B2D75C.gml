flags.do_save = false;
flags.do_once = false;
condition = function()
{
	return place_meeting(x, y, obj_player) && !instance_exists(obj_cutsceneManager) && global.treat == 0;
};
output = function()
{
	portal_activate(inst_E61C34F, true);
};