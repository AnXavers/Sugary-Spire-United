/// @function _bnet_network_send_raw(client_id, socket, bufferid, size)
function _bnet_network_send_raw(argument0, argument1, argument2, argument3) {

	/* @description						A wrapper function to stream a tcp packet bnet encoded.
									
										NOTE THERE MUST BE NO UNUSED BYTES. BEHIND THE SCENE BNET
										LOOPS UNTIL ALL DATA READ.
	*/

	/// @param {string} client_id		Id to attach to to packet. Maximum length of 255 chars.
	/// @param {real}	socket			The id of the socket to use.
	/// @param {real}	bufferid		The id of the buffer to get the data from.
	/// @param {real}	size			The size (in bytes) of the data.

	var 
	__bnet_id		= argument0,
	__bnet_size		= argument3,
	__bnet_new_size = __bnet_size + 9 + string_length(__bnet_id);

	buffer_resize(_bnet_tcp_buffer, __bnet_new_size);

	buffer_seek(_bnet_tcp_buffer, buffer_seek_start, 0);

	buffer_write(_bnet_tcp_buffer, buffer_text,		"BNet"+_bnet_connection_type);//5
	buffer_write(_bnet_tcp_buffer, buffer_u8,		string_length(__bnet_id));//6
	buffer_write(_bnet_tcp_buffer, buffer_u16,		__bnet_size);//8
	
	buffer_write(_bnet_tcp_buffer, buffer_string,	__bnet_id);//9

	buffer_copy(argument2, 0, __bnet_size, _bnet_tcp_buffer, __bnet_new_size - __bnet_size);

	network_send_raw(argument1, _bnet_tcp_buffer, __bnet_new_size);


}
