if (!global.breakables && object_index != obj_gummyharry)
{
	if string_starts_with(object_get_name(object_index), "obj_secret")
	{
		for (var i = 0; i < array_length(tiles); i++)
			scr_destroy_tile(tiles[i]);
		scr_destroy_nearby_tiles();
	}
	instance_destroy(self, false);
}
event_inherited();
depth = 1;
DestroyedBy = -4;
sprite_index = obj_player.spr_metal_destroyable