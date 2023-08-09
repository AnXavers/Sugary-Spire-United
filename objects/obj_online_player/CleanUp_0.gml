if ds_map_exists(global.online_players, online_id)
    ds_map_delete(global.online_players, online_id)
instance_destroy(name_text)
var size = ds_map_size(sounds)
var key = ds_map_find_first(sounds)
for (var i = 0; i < size; i++)
{
    audio_stop_sound(key)
    key = ds_map_find_next(sounds, key)
}