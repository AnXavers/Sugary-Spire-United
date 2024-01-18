/// @function bnet_network_send_broadcast_tcp(list, buffer, omit)
function _bnet_network_send_broadcast_tcp(argument0, argument1, argument2) {

	/* @description					SYSTEM FUNCTION DO NOT DELETE!!!
									FOR GML SERVER USE ONLY.
								
									Broadcast a bnet encoded buffer to a list of clients.
	*/

	/// @param {ds_list} list		Client list to broadcast to.
	/// @param {buffer} buffer		Buffer to send.
	/// @param {ds_map} omit		A client to omit.

	/// @return {bool}				Whether you're in the list.

	var
	__bnet_list			= argument0,
	__bnet_buffer		= argument1,
	__bnet_omit			= argument2,
	__bnet_buffer_size	= buffer_get_size(__bnet_buffer),
	__bnet_list_size	= ds_list_size(__bnet_list),
	__bnet_me			= false,
	__bnet_client;

	for(var i = 0; i < __bnet_list_size; i++){
		__bnet_client = __bnet_list[| i];
	
		if(__bnet_client == __bnet_omit) continue;
	
		if(__bnet_client[? "id"] == _bnet_id) __bnet_me = true;
		else _bnet_network_send_raw(__bnet_client[? "id"], __bnet_client[? "socket"], __bnet_buffer, __bnet_buffer_size);
	}

	return __bnet_me;


}
