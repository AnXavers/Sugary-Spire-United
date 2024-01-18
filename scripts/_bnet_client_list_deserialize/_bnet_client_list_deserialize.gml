/// @param {buffer} buffer
function _bnet_client_list_deserialize(argument0) {

	var
	__bnet_buffer							= argument0,
	__bnet_size								= buffer_read(__bnet_buffer, buffer_u16),
	__bnet_list								= ds_list_create(),
	__bnet_map								= ds_map_create(),
	__bnet_map_;

	repeat(__bnet_size){
		__bnet_map_							= _bnet_client_deserialize(__bnet_buffer);
	
		__bnet_map[? __bnet_map_[? "id"]]	= __bnet_map_;
	
		ds_list_add(__bnet_list, __bnet_map_);
	}

	return [__bnet_map, __bnet_list];


}
