/// @function bnet_namespace_create(name)
function bnet_namespace_create(argument0) {

	/// @description			Sends a request to create a custom namespace.

	/// @param {string} name	Namespace name.

	/// @call-back				namespace_created

	/// @error-codes			"500"

#region Example
	/*
		bnet_namespace_create("friend_list" + bnet("id"));
	*/
#endregion

	with(BNET_NETWORKMANAGER.id){
		if(_bnet_type == 0){
			var
			__bnet_id			= argument0,
			__bnet_namespace	= _bnet_server_namespace_map[? __bnet_id];
										
			if(__bnet_namespace == undefined){
				__bnet_namespace						= ds_map_create();
				__bnet_namespace[? "name"]				= __bnet_id;
				__bnet_namespace[? "client_list"]		= ds_list_create();
				__bnet_namespace[? "client_map"]		= ds_map_create();
											
				_bnet_server_namespace_map[? __bnet_id]	= __bnet_namespace;
				_bnet_server_list_map[? __bnet_id]		= __bnet_namespace[? "client_list"];
											
				_bnet_logger("Namespace created");
									
				var __bnet_map		= ds_map_create();
				__bnet_map[? "name"]= __bnet_id;
									
				_bnet_callback_push(bnet_callbacks.namespace_created, __bnet_map);
			}else{
				_bnet_sendError(_bnet_tcp_socket, _bnet_write_buffer, "500");
		 																
				_bnet_logger("FAILED TO CREATE NAMESPACE. ALREADY EXISTS");
			}
		}else{
			buffer_seek(_bnet_write_buffer,  buffer_seek_start, 0);
		
			buffer_write(_bnet_write_buffer, buffer_s8,		5);
			buffer_write(_bnet_write_buffer, buffer_s8,		0);
			buffer_write(_bnet_write_buffer, buffer_string, argument0);
						
			_bnet_network_send_raw(_bnet_id, _bnet_tcp_socket, _bnet_write_buffer, buffer_tell(_bnet_write_buffer));
		
			_bnet_logger("NAMESPACE CREATE REQUEST SENT");
		}
	}


}
