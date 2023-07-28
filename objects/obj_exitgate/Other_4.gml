if (ds_list_find_index(global.saveroom, id) != -1 && (global.panic == 0 || room == sucrose_1))
	sprite_index = spr_exitgateclosed;
if (drop && ds_list_find_index(global.doorsave, id) != -1)
{
	drop_state = 1;
	y = drop_y;
}
