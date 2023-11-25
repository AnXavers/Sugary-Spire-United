if (ds_list_find_index(global.saveroom, id) != -1)
	instance_destroy();
if (!global.breakables && object_index != obj_gummyharry)
{
	if string_starts_with(object_get_name(object_index), "obj_secret")
	{
		for (var i = 0; i < array_length(tiles); i++)
			scr_destroy_tile(tiles[i]);
		scr_destroy_nearby_tiles();
	}
	with obj_oneway
	{
		if (instance_exists(solidid))
			instance_destroy();
	}
	instance_destroy(self, false);
}