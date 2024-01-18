/// @function bnet_event_execute_broadcast_udp(list, script_name, data)
function bnet_event_execute_broadcast_udp(argument0, argument1, argument2) {

	/* @description						Broadcast to a list of clients to execute 
										provided script with data as its argument(s).
	*/


	/// @param {string} list			List to broadcast too. bnet("server"), bnet("room"), "namespace_id". Default: bnet("server").
	/// @param {string} script_name		Script name to execute.
	/// @param {string} data			String data to send as a argument for the script.

	/// @event							"name of the script provided"

	/// @error-codes					"004"

#region Example
	/*
		var map			 = ds_map_create();
		map[? "default"] = "HellowWorld";
	
		bnet_event_execute_broadcast_udp("client_id", "src_helloWorld", json_encode(map));
	
		ds_map_destroy(map);
	*/
#endregion

	with(BNET_NETWORKMANAGER.id){
		if(_bnet_type == 0){
			var 
			__bnet_list_id	= argument0,
			__bnet_list		= _bnet_server_list_map[? __bnet_list_id];
		
			if(__bnet_list != undefined){
				buffer_seek(_bnet_write_buffer,  buffer_seek_start, 0);
		
				buffer_write(_bnet_write_buffer, buffer_s8,		-3);
				buffer_write(_bnet_write_buffer, buffer_string, __bnet_list_id);
				buffer_write(_bnet_write_buffer, buffer_string,	argument1);
				buffer_write(_bnet_write_buffer, buffer_string,	argument2);
			
				buffer_resize(_bnet_write_buffer, buffer_tell(_bnet_write_buffer));
		
				if(_bnet_network_send_broadcast_udp(_bnet_id, __bnet_list, _bnet_write_buffer, undefined)){
				
				}
			}else{
				_bnet_sendError(_bnet_tcp_socket, _bnet_write_buffer, "004");
								
				_bnet_logger_client(_bnet_id, "FAILED TO BROADCAST AN EVENT. INVALID LIST ID");
			}
		}else{
			buffer_seek(_bnet_write_buffer,  buffer_seek_start, 0);
		
			buffer_write(_bnet_write_buffer, buffer_s8,		-4);
			buffer_write(_bnet_write_buffer, buffer_string, argument0);
			buffer_write(_bnet_write_buffer, buffer_string,	argument1);
			buffer_write(_bnet_write_buffer, buffer_string,	argument2);
						
			_bnet_network_send_udp_raw(_bnet_id, _bnet_udp_socket, _bnet_ip, _bnet_server_udp_port, _bnet_write_buffer, buffer_tell(_bnet_write_buffer), _bnet_ping, _bnet_congestion_thresh);
		}
	
		_bnet_logger("BROADCAST TCP SCRIPT EXECUTE SENT");
	}


}
