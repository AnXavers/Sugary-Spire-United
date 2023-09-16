flags.do_once_per_save = false;
output = function()
{
	obj_npc.x = 544
	obj_npc.y = 320
};
condition = function()
{
	return (obj_player.sprite_index != spr_pizzelle_taunt)
};
