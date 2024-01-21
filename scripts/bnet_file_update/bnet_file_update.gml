/// @function bnet_file_update(fname, data)
function bnet_file_update(argument0, argument1) {

	/*  @description				Request to update the contents of a file.
								
									WARNING!!! Beware of congestion. This function is taxing on server, use sparsely.
	*/

	/// @param {string} fname		File name.
	/// @param {string} data		Data to replace previous with.

	/// @call-back					file_updated

	/// @error-codes				"402"

#region Example
	/*
		var map			= ds_map_create();
		map[? "name"]	= bnet("name");
		map[? "coins"]	= coins;
	
		bnet_file_update("save_data", json_encode(map));
	
		ds_map_destroy(map);
	*/
#endregion

	with(BNET_NETWORKMANAGER.id){
		if(_bnet_type == 1){
			buffer_seek(_bnet_write_buffer,  buffer_seek_start, 0);
		
			buffer_write(_bnet_write_buffer, buffer_s8,		4);
			buffer_write(_bnet_write_buffer, buffer_s8,		2);
			buffer_write(_bnet_write_buffer, buffer_string, argument0);
			buffer_write(_bnet_write_buffer, buffer_string, argument1);
						
			_bnet_network_send_raw(_bnet_id, _bnet_tcp_socket, _bnet_write_buffer, buffer_tell(_bnet_write_buffer));
		
			_bnet_logger("file update sent");
		}
	}


}
