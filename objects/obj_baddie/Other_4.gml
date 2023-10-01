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
if (global.lapcount >= 3 && global.inflapping == 1)
{
	eliteEnemy = 1;
	if sprite_get_width(spr_palette) >= 2
		paletteselect = 1;
	if global.lapcount >= 5
	{
		eliteHPMax = (global.lapcount - 3)
		eliteHP = (global.lapcount - 3)
	}
}