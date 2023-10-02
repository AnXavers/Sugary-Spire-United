if ((ds_list_find_index(global.saveroom, id) == -1) && (global.levelname != "yogurt"))
{
	repeat (2)
	{
		instance_create(x, y, obj_bangeffect);
		instance_create(x, y, obj_slapstar);
	}
	audio_pause_all()
	ds_list_add(global.saveroom, id);
	with (instance_create(x, y, obj_harryfreeze))
		paletteselect = other.paletteselect;
}
