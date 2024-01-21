/// @function _bnet_buffer_cache_destroy()
function _bnet_buffer_cache_destroy() {

	/// @description Cleans up bnet send cache list.
	_bnet_buffer_cache_clear();

	ds_list_destroy(_bnet_buffer_cache_list);


}
