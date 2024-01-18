/// @function bnet_event_execute_tcp(client_id, script_name, data)
function bnet_event_execute_tcp(argument0, argument1, argument2) {

	/* @description						Sends a request to a client to execute provided script
										with data as its argument.
	*/

	/// @param {string} client_id		Client's id to which to send it too.
	/// @param {string} script_name		Script name to execute.
	/// @param {string} data			String data to send as a argument for the script.

	/// @event							"name of the script provided"

	/// @error-codes					"003"

#region Example
	/*
		var map			 = ds_map_create();
		map[? "default"] = "HellowWorld";
	
		bnet_event_execute_tcp("client_id", "src_helloWorld", json_encode(map));
	
		ds_map_destroy(map);
	*/
#endregion

	with(BNET_NETWORKMANAGER.id){
		if(_bnet_type == 0){
			var 
			__bnet_client_id	= argument0,
			__bnet_client		= _bnet_server_client_map[? __bnet_client_id];
							
			if(__bnet_client != undefined){
				var
				__bnet_script	= argument1,
				__bnet_data		= argument2;
		
				if(__bnet_client == _bnet_server_local_client_map){
					_bnet_logger_client(_bnet_id, "REQUESTED TO EXECUTE A CUSTOM EVENT");
							
					script_execute(asset_get_index(__bnet_script), __bnet_data);
				}else{
					buffer_seek(_bnet_write_buffer,  buffer_seek_start, 0);
		
					buffer_write(_bnet_write_buffer, buffer_s8,		-3);
					buffer_write(_bnet_write_buffer, buffer_string, __bnet_client_id);
					buffer_write(_bnet_write_buffer, buffer_string,	__bnet_script);
					buffer_write(_bnet_write_buffer, buffer_string,	__bnet_data);
			
					_bnet_network_send_raw(_bnet_id, __bnet_client[? "socket"], _bnet_write_buffer, buffer_tell(_bnet_write_buffer));
												
					_bnet_logger_client(_bnet_id, "SENT A EVENT TO A CLIENT");
				}
			}else{
				_bnet_sendError(_bnet_tcp_socket, _bnet_write_buffer, "003");
								
				_bnet_logger_client(_bnet_id, "SENT A EVENT TO A CLIENT FAILED. INVALID CLIENT ID");
			
				exit;
			}
		}else{
			buffer_seek(_bnet_write_buffer,  buffer_seek_start, 0);
		
			buffer_write(_bnet_write_buffer, buffer_s8,		-3);
			buffer_write(_bnet_write_buffer, buffer_string, argument0);
			buffer_write(_bnet_write_buffer, buffer_string,	argument1);
			buffer_write(_bnet_write_buffer, buffer_string,	argument2);
						
			_bnet_network_send_raw(_bnet_id, _bnet_tcp_socket, _bnet_write_buffer, buffer_tell(_bnet_write_buffer));
		}
	
		_bnet_logger("TCP SCRIPT EXECUTE SENT");
	}


}
