flags.do_once_per_save = false;
output = function()
{
	obj_npc.x = -999
	obj_npc.y = -999
};
condition = function()
{
	return ((obj_player.sprite_index == spr_pizzelle_taunt) && (obj_player.image_index == 16))
};
