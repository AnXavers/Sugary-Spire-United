if (ds_list_find_index(global.baddieroom, id) != -1 && global.lapcount < 10)
	instance_destroy();
if global.lapcount >= 10
	panicEscape = 1
if (panicEscape)
	state = enemystates.panicWait;
else
	scr_enemyDestroyableCheck();
if (use_heat())
{
	if (object_index != obj_googlyjuice && object_index != obj_fizz)
		paletteselect = 1;
}
if (global.lapcount >= 3 && global.lapmode == 1)
{
	eliteEnemy = 1;
	elite = 1;
	if sprite_get_width(spr_palette) >= 2
		paletteselect = 1;
	if global.lapcount >= 5
	{
		eliteHPMax = (global.lapcount - 3)
		eliteHP = (global.lapcount - 3)
		var multiplyfactor = clamp(global.lapcount * 0.05, 0.5, 1)
		var ranx = choose(irandom_range(64, 256), irandom_range(-256, -64))
		if (global.lapcount >= 10 && chance(multiplyfactor) && !place_meeting(x + ranx, y, par_collision) && !isDupe)
		{
			with instance_create(x + ranx, y, self.object_index)
			{
				panicEscape = 1
				isDupe = 1
			}
		}
	}
}