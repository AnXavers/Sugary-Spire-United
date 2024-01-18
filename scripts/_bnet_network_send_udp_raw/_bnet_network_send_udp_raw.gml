/// @function _bnet_network_send_udp_raw(socket, ip, port, buffer, size)
function _bnet_network_send_udp_raw(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) {

	/// @description						Queues a bnet encoded buffer tagged as udp.

	/// @param {string} client_id			Client's id to tag with buffer.
	/// @param {socket} socket				Socket which to send data through.
	/// @param {string} ip					Recipient's ip.
	/// @param {real}	port				Recipient's port.
	/// @param {real}	buffer				Buffer id.
	/// @param {real}	size				Size at which to break buffer into.
	/// @param {real}	clientPing			Client's ping to check for congestion. DEFAULT: 0.
	/// @param {real}	congestionThresh	Threshold for if to send packet or not. DEFAULT: 255.

	var 
	__bnet_socket			= argument1,
	__bnet_ip				= argument2,
	__bnet_port				= argument3,
	__bnet_buffer			= _bnet_buffer_encode(argument0, argument4, argument5, _bnet_connection_type),
	__bnet_size				= array_length_1d(__bnet_buffer) - 1,
	__bnet_congestionThresh	= argument7;

	if(argument6 > __bnet_congestionThresh || __bnet_size > __bnet_congestionThresh) exit;

	for(var i = 0; i < __bnet_size; i++) ds_list_add(_bnet_buffer_cache_list, [__bnet_buffer[i], __bnet_socket, false, __bnet_ip, __bnet_port]);


}
