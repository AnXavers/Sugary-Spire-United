if (ds_list_find_index(global.baddieroom, id) != -1)
	instance_destroy();
if (ds_list_find_index(global.saveroom, id) != -1)
{
	theifkeyinv = true;
	ds_list_delete(global.saveroom, ds_list_find_index(global.saveroom, id));
}
if (panicEscape)
	state = 12;
