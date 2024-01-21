/// @function bnet_file_read(fname)
function bnet_file_read(argument0) {

	/*  @description			Request to load a file from the server.
							
								WARNING!!! Beware of congestion. This function is taxing on server, use sparsely.
	*/

	/// @param {string} fname	File name to load.

	/// @call-back				file_updated

	/// @error-codes			"401"

#region Example
	/*
		bnet_file_read("save_data");
	
		case bnet_callbacks.file_updated:
			savedata = ds_map_create();
		
			ds_mp_copy(savedata, bnet_callback_load);
		
			name	= savedata[? "name"];
			coins	= savedata[? "coins"];
		break;
	*/
#endregion

	with(BNET_NETWORKMANAGER.id){
		if(_bnet_type == 1){
			buffer_seek(_bnet_write_buffer,  buffer_seek_start, 0);
		
			buffer_write(_bnet_write_buffer, buffer_s8,		4);
			buffer_write(_bnet_write_buffer, buffer_s8,		1);
			buffer_write(_bnet_write_buffer, buffer_string, argument0);
						
			_bnet_network_send_raw(_bnet_id, _bnet_tcp_socket, _bnet_write_buffer, buffer_tell(_bnet_write_buffer));
		
			_bnet_logger("file read sent");
		}
	}


}
