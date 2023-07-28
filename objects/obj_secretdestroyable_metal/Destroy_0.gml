event_inherited();
for (var i = 0; i < array_length(tiles); i++)
	scr_destroy_tile(tiles[i]);
scr_destroy_nearby_tiles();
