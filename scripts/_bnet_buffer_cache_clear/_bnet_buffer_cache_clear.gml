/// @function _bnet_buffer_cache_clear()
function _bnet_buffer_cache_clear() {

	/// @description Empties bnet encoded buffer array.
	var __bnet_size = ds_list_size(_bnet_buffer_cache_list);

	for(var i = 0; i < __bnet_size; i++){
		buffer_delete(array_get(_bnet_buffer_cache_list[| i], 0));
	
		ds_list_delete(_bnet_buffer_cache_list, i);
	
		__bnet_size--;
	
		i--;
	}


}
