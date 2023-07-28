if (ds_list_find_index(global.baddieroom, id) != -1)
	instance_destroy();
if (panicEscape)
	state = enemystates.panicWait;
else
	scr_enemyDestroyableCheck();
if (use_heat())
{
	if (object_index != obj_googlyjuice && object_index != obj_fizz)
		paletteselect = 1;
}
