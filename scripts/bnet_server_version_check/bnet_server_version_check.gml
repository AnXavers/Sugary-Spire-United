/// @function bnet_server_version_check()
function bnet_server_version_check() {

	/// @description	Request server version.

	/// @call-back		version_checked

#region Example
	/*
		bnet_server_version_check();
	*/
#endregion

	with(BNET_NETWORKMANAGER.id){
		buffer_resize(_bnet_write_buffer, 1);
	
		buffer_seek(_bnet_write_buffer,  buffer_seek_start, 0);
	
		buffer_write(_bnet_write_buffer, buffer_u8,	-5);
					
		_bnet_network_send_raw(_bnet_id, _bnet_tcp_socket, _bnet_write_buffer, 1);
	
		_bnet_logger("VERSION REQUEST SENT");
	}


}
