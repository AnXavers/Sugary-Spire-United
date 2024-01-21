/// @param {buffer} buffer		Buffer to read from.
function _bnet_instance_list_deserialize(argument0) {
	var 
	__bnet_buffer								= argument0,
	__bnet_loop									= buffer_read(__bnet_buffer, buffer_u16),
	__bnet_list									= ds_list_create(),
	__bnet_map									= ds_map_create(),
	__bnet_instance;

	repeat(__bnet_loop){
		__bnet_instance							= _bnet_instance_deserialize(__bnet_buffer);
	
		__bnet_map[? __bnet_instance[? "id"]]	= __bnet_instance;
	
		ds_list_add(__bnet_list, __bnet_instance);
	}

	return [__bnet_map, __bnet_list];


}
