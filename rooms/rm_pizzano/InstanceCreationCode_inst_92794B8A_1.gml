flags.do_save = false;
flags.do_once = false;
condition = function()
{
	return place_meeting(x, y, obj_player) && !instance_exists(obj_cutsceneManager) && obj_painter.state == painterstates.waiting;
};
output = function()
{
	cutscene_create([scr_paintercut_prestart, scr_paintercut_look, scr_paintercut_walk, scr_paintercut_notice, scr_paintercut_turn2, scr_paintercut_jump, scr_paintercut_checkland]);
};
