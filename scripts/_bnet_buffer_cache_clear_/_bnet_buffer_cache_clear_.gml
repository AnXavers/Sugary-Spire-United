/// @function _bnet_buffer_cache_clear_()
function _bnet_buffer_cache_clear_(argument0) {

	/// @description Empties bnet decoded cache.
	var
	__bnet_list = argument0,
	__bnet_size = ds_list_size(__bnet_list),
	__bnet_buffer,
	__bnet_buffer_list;

	for(var i = 0; i < __bnet_size; i++){
		__bnet_buffer		= __bnet_list[| i];
	
		__bnet_buffer_list	= __bnet_buffer[? "list"];
	
		var __bnet_size_	= ds_list_size(__bnet_buffer_list);
	
		for(var o = 0; o < __bnet_size_; o++) buffer_delete(__bnet_buffer_list[| o]);
	
		ds_list_destroy(__bnet_buffer_list);
	
		ds_map_destroy(__bnet_buffer);	
	}


}
