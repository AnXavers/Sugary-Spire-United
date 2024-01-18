/// @function _bnet_client_list_serialize(list, buffer);
function _bnet_client_list_serialize(argument0, argument1) {

	/// @param list
	/// @param buffer

	var
	__bnet_list		= argument0,
	__bnet_size		= ds_list_size(__bnet_list),
	__bnet_buffer	= argument1,
	__bnet_client;

	buffer_write(__bnet_buffer, buffer_u16, __bnet_size);

	for(var i = 0; i < __bnet_size; i++) {
		__bnet_client = __bnet_list[| i];
	
		_bnet_client_serialize(__bnet_buffer, __bnet_client);
	}


}
