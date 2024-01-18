/// @function _bnet_buffer_cache_destroy_(hashmap, list)
function _bnet_buffer_cache_destroy_(argument0, argument1) {

	/// @description Cleans up bnet decoded buffer.
	var __bnet_list	= argument1;

	_bnet_buffer_cache_clear_(__bnet_list);

	ds_map_destroy(argument0);

	ds_list_destroy(__bnet_list);


}
