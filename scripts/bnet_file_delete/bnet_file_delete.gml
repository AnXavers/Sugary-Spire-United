/// @function bnet_file_destroy(fname)
function bnet_file_delete(argument0) {

	/*  @description				Request to destroy a file from the server.
								
									WARNING!!! Beware of congestion. This function is taxing on server, use sparsely.
	*/

	/// @param {string} fname		File name.

	/// @call-back					file_deleted

	/// @error-codes				"403"

#region Example
	/*
		bnet_file_destroy("save_data");
	*/
#endregion

	with(BNET_NETWORKMANAGER.id){
		if(_bnet_type == 1){
			buffer_seek(_bnet_write_buffer,  buffer_seek_start, 0);
		
			buffer_write(_bnet_write_buffer, buffer_s8,		4);
			buffer_write(_bnet_write_buffer, buffer_s8,		3);
			buffer_write(_bnet_write_buffer, buffer_string, argument0);
						
			_bnet_network_send_raw(_bnet_id, _bnet_tcp_socket, _bnet_write_buffer, buffer_tell(_bnet_write_buffer));
		
			_bnet_logger("file delete sent");
		}
	}


}
