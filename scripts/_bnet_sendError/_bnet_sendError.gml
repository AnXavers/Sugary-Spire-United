/// @function _bnet_sendError(socket, buffer, code)
/// @description				A simple function to send an error message to a client.
function _bnet_sendError(argument0, argument1, argument2) {

	/// @param {real} socket		Client socket to send too.
	/// @param {buffer} buffer		Buffer to use for writing.
	/// @param {string} error		Eror code to send.

	var 
	__bnet_socket = argument0,
	__bnet_buffer = argument1,
	__bnet_error  = argument2;

	if(__bnet_socket != _bnet_tcp_socket){
		buffer_seek(__bnet_buffer, buffer_seek_start, 0);
        
		buffer_write(__bnet_buffer, buffer_s8, -2);
		buffer_write(__bnet_buffer, buffer_string, __bnet_error);
				
		_bnet_network_send_raw(_bnet_id, __bnet_socket, __bnet_buffer, buffer_tell(__bnet_buffer));
	}else{
		var __bnet_map			= ds_map_create();
		__bnet_map[? "error"]	= __bnet_error;
	
		_bnet_callback_push(bnet_callbacks.onError, __bnet_map);
	}


}
