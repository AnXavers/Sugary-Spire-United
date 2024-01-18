/// @function _bnet_network_send_broadcast_udp(client_id list, buffer, omit)
function _bnet_network_send_broadcast_udp(argument0, argument1, argument2, argument3) {

	/* @description					SYSTEM FUNCTION DO NOT DELETE!!!
								
									Broadcast a bnet encoded buffer to a list of clients.
	*/

	/// @param {string} client_id
	/// @param {ds_list} list		Client list to broadcast to.
	/// @param {buffer} buffer		Buffer to send.
	/// @param {ds_map} omit		A client to omit.

	/// @return {bool}				Whether you're in the list.

	var
	__bnet_client_id	= argument0,
	__bnet_list			= argument1,
	__bnet_buffer		= argument2,
	__bnet_omit			= argument3,
	__bnet_me			= false,
	__bnet_size			= ds_list_size(__bnet_list), 
	__bnet_client;

	for(var i = 0; i < __bnet_size; i++){
		__bnet_client = __bnet_list[| i];
	
		if(__bnet_client == __bnet_omit) continue;
	
		if(__bnet_client[? "id"] == _bnet_id) __bnet_me = true;
		else _bnet_network_send_udp_raw(__bnet_client_id, _bnet_udp_socket, __bnet_client[? "ip"], __bnet_client[? "udp_port"], __bnet_buffer, _bnet_mtu, __bnet_client[? "ping"], _bnet_congestion_thresh);	
	}

	return __bnet_me;


}
