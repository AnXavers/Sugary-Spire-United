if (ds_list_find_index(global.saveroom, id) != -1)
{
	if (!givenPoints)
	{
		audio_stop_sound(sound_points);
		scr_sound(sound_points);
		global.collect += 50;
		create_small_number(x, y, "50");
		instance_create(x, y, obj_collecteffect, 
		{
			choosed: true,
			sprite_index: spr_donut_boil
		});
		givenPoints = true;
	}
}
