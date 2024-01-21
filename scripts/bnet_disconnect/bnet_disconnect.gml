/// @function bnet_disconnect()
function bnet_disconnect() {

	/// @description	Proper way to clean up bnet client after it has been initiated.

	/// @call-back		disconnected

	with(BNET_NETWORKMANAGER){
		buffer_seek(_bnet_write_buffer, buffer_seek_start, 0);
	
		buffer_write(_bnet_write_buffer, buffer_s8, 0);
		buffer_write(_bnet_write_buffer, buffer_s8, 1);
	
		_bnet_network_send_raw(_bnet_id, _bnet_tcp_socket, _bnet_write_buffer, 2);
	
		instance_destroy();
	
		_bnet_callback_push(bnet_callbacks.disconnected);
	}


}
