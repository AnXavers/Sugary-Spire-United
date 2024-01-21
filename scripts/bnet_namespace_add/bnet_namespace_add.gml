/// @function bnet_namespace_add(name, client_id)
function bnet_namespace_add(argument0, argument1) {

	/// @description					Sends a request to add a client to a namespace.

	/// @param {string} name			Namespace name.
	/// @param {string} client_id		Client's id who to add to namespace.

	/// @call-back						namespace_updated

	/// @error-codes					"501", "502", "503"

#region Example
	/*
		bnet_namespace_add("friend_list" + bnet("id"), "client_id");
	*/
#endregion

	with(BNET_NETWORKMANAGER.id){
		if(_bnet_type == 0){
			var __bnet_namespace = _bnet_server_namespace_map[? argument0];
	 																
			if(__bnet_namespace != undefined) {
			 	var __bnet_client = _bnet_server_client_map[? argument1];
	 																	
			 	if(__bnet_client != undefined) {
			 		if(ds_map_find_value(__bnet_namespace[? "client_map"], __bnet_client[? "id"]) == undefined) {
					
				 		ds_list_add(__bnet_namespace[? "client_list"], __bnet_client);
				 		ds_map_add(__bnet_namespace[? "client_map"], __bnet_client[? "id"], __bnet_client);
		 																		
					 	buffer_seek(_bnet_write_buffer, buffer_seek_start, 0);
																		        
						buffer_write(_bnet_write_buffer, buffer_s8,		5);
						buffer_write(_bnet_write_buffer, buffer_s8,		1);
						buffer_write(_bnet_write_buffer, buffer_string, __bnet_namespace[? "name"]);
				 								
						_bnet_client_list_serialize(__bnet_namespace[? "client_list"], _bnet_write_buffer);
				 																
						buffer_resize(_bnet_write_buffer, buffer_tell(_bnet_write_buffer));
				 																
						if(_bnet_network_send_broadcast_tcp(__bnet_namespace[? "client_list"], _bnet_write_buffer, undefined)){
							_bnet_logger("Namespace updated");
													
							buffer_seek(_bnet_write_buffer, buffer_seek_start, 2);
									
							var __bnet_map					= ds_map_create();
							__bnet_map[? "name"]			= buffer_read(_bnet_write_buffer, buffer_string);
							var __bnet_vec2					= _bnet_client_list_deserialize(_bnet_write_buffer);
									
							__bnet_map[? "client_map"]		= __bnet_vec2[0];
							__bnet_map[? "client_list"]		= __bnet_vec2[1];
									
							_bnet_callback_push(bnet_callbacks.namespace_updated, __bnet_map);
						}
				 																
						_bnet_logger_client(_bnet_id, "ADDED A CLIENT TO A NAMESPACE");
			 		}else {
			 			_bnet_sendError(_bnet_tcp_socket, _bnet_write_buffer, "501");
				 																
						_bnet_logger_client(_bnet_id, "FAILED TO ADD A CLIENT TO NAMESPACE. CLIENT CLIENT ALREADY WITHIN IT");
			 		}
			 	}else {
			 		_bnet_sendError(_bnet_tcp_socket, _bnet_write_buffer, "502");
			 																
					_bnet_logger_client(_bnet_id, "FAILED TO ADD A CLIENT TO NAMESPACE. CLIENT DOESNT EXISTS");
			 	}
			}else {
			 	_bnet_sendError(_bnet_tcp_socket, _bnet_write_buffer, "503");
		 																
				_bnet_logger_client(_bnet_id, "FAILED TO ADD A CLIENT TO NAMESPACE. NAMESPACE DOESNT EXISTS");
			}	
		}else{
			buffer_seek(_bnet_write_buffer,  buffer_seek_start, 0);
		
			buffer_write(_bnet_write_buffer, buffer_s8,		5);
			buffer_write(_bnet_write_buffer, buffer_s8,		1);
			buffer_write(_bnet_write_buffer, buffer_string, argument0);
			buffer_write(_bnet_write_buffer, buffer_string, argument1);
						
			_bnet_network_send_raw(_bnet_id, _bnet_tcp_socket, _bnet_write_buffer, buffer_tell(_bnet_write_buffer));
		
			_bnet_logger("ADD CLIENT TO NAMESPACE REQUEST SENT");
		}
	}


}
