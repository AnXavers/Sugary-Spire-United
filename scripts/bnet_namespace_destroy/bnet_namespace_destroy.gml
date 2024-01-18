/// @function bnet_namespace_destroy(name)
function bnet_namespace_destroy(argument0) {

	/// @description			Sends a request to destroy a custom namrepace.

	/// @param {string} name	Namespace name.

	/// @call-back				namespace_destroyed

	/// @error-codes			"506"

#region Example
	/*
		bnet_namespace_destroy("friend_list" + bnet("id"));
	*/
#endregion

	with(BNET_NETWORKMANAGER.id){
		if(_bnet_type == 0){
			var 
			__bnet_id			= argument0,
			__bnet_namespace	= _bnet_server_namespace_map[? __bnet_id];
	 																
			if(__bnet_namespace != undefined) {
			 	buffer_seek(_bnet_write_buffer, buffer_seek_start, 0);
																        
				buffer_write(_bnet_write_buffer, buffer_s8, 5);
				buffer_write(_bnet_write_buffer, buffer_s8, 2);
				buffer_write(_bnet_write_buffer, buffer_string, __bnet_namespace[? "name"]);
		 																
				buffer_resize(_bnet_write_buffer, buffer_tell(_bnet_write_buffer));
		 																
				if(_bnet_network_send_broadcast_tcp(__bnet_namespace[? "client_list"], _bnet_write_buffer, undefined)){
					_bnet_logger("Namespace destroyed");
				
					var __bnet_map			= ds_map_create();
					__bnet_map[? "name"]	= __bnet_id;
									
					_bnet_callback_push(bnet_callbacks.namespace_destroyed, __bnet_map);
				}
		 																
				ds_map_delete(_bnet_server_namespace_map, __bnet_id);
			
				ds_map_delete(_bnet_server_list_map, __bnet_namespace[? "name"]);
										
				ds_list_destroy(__bnet_namespace[? "client_list"]);
			
				ds_map_destroy(__bnet_namespace[? "client_map"]);
			
				ds_map_destroy(__bnet_namespace);
		 																
				_bnet_logger("DESTROYED A NAMESPACE");
			}else {
			 	_bnet_sendError(_bnet_tcp_socket, _bnet_write_buffer, "506");
		 																
				_bnet_logger("FAILED TO DESTROY NAMESPACE. NAMESPACE DOESNT EXISTS");
			}	
		}else{
			buffer_seek(_bnet_write_buffer,  buffer_seek_start, 0);
		
			buffer_write(_bnet_write_buffer, buffer_s8,		5);
			buffer_write(_bnet_write_buffer, buffer_s8,		3);
			buffer_write(_bnet_write_buffer, buffer_string, argument0);
						
			_bnet_network_send_raw(_bnet_id, _bnet_tcp_socket, _bnet_write_buffer, buffer_tell(_bnet_write_buffer));
		
			_bnet_logger("DESTROY NAMESPACE REQUEST SENT");
		}
	}


}
