if (ds_list_find_index(global.saveroom, id) == -1)
{
	ds_list_add(global.saveroom, id);
	global.collect += 150;
	global.pizzameter += 5;
	global.combofreeze = 30;
	global.combotime += 45;
	create_small_number(x, y, "150");
}
