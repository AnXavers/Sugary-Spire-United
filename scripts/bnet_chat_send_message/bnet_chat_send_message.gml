/// @function bnet_chat_send_message(message, *list, *id)
function bnet_chat_send_message() {

	/* @description					Sends a message to targeted Client or group. 
									If only message is provided, will send to "server".
	*/

	/// @param {string} message		Message to send to a Client or Client's.
	/// @param {string} *list		OPTIONAL Which list to target. bnet("server"), bnet("room"), "namespace_id". Default: bnet("server").
	/// @param {string} *id			OPTIONAL Client's id whom you wish to message only.

	/// @call-back					chat_updated

	/// @error-codes				"100", "101"

#region Examples
	/*
		Send to every Client with in server list.
			bnet_chat_send_message(“hello”);
		
		Message everyone within my room.
			bnet_chat_send_message("hi there", bnet("room"));
		
		case bnet_callbacks.chat_updated:
			var copy = ds_map_create();
			
			ds_map_copy(copy, bnet_callback_load);
			
			ds_list_add(global.messages, copy);
			
			if(ds_list_size(global.messages) > 10){
				ds_map_destroy(global.messages[| 0]);
				ds_list_delete(global.messages, 0);
			}
		break;
	*/
#endregion

	with(BNET_NETWORKMANAGER.id){
		var 
		__bnet_list_id			= (argument_count > 1? argument[1]: _bnet_client_list),
		__bnet_client_id		= "";
	
		if(argument_count > 2){
			__bnet_list_id		= "";
			__bnet_client_id	= argument[2];
		}
	
		if(_bnet_type == 0){
			var __bnet_message	= argument[0];
		
			if(__bnet_list_id != ""){
				var __bnet_target_list = _bnet_server_list_map[? __bnet_list_id];
											
				if(__bnet_target_list != undefined){
					buffer_seek(_bnet_write_buffer, buffer_seek_start, 0);
	 																		
			 		buffer_write(_bnet_write_buffer, buffer_s8,		1);
			 		buffer_write(_bnet_write_buffer, buffer_s8,		0);
	 																		
			 		_bnet_client_serialize(_bnet_write_buffer,  _bnet_server_local_client_map);
				
					buffer_write(_bnet_write_buffer, buffer_string, __bnet_list_id);
			 		buffer_write(_bnet_write_buffer, buffer_string, __bnet_message);
	 																		
			 		buffer_resize(_bnet_write_buffer, buffer_tell(_bnet_write_buffer));
	 																		
			 		if(_bnet_network_send_broadcast_tcp(__bnet_target_list, _bnet_write_buffer, undefined)){
						_bnet_logger("CHAT UPDATED");
							
						buffer_seek(_bnet_write_buffer, buffer_seek_start, 2);
												
						var __bnet_map			= _bnet_client_deserialize(_bnet_write_buffer);
						__bnet_map[? "list"]	= __bnet_list_id;
						__bnet_map[? "message"] = __bnet_message;
									
						_bnet_callback_push(bnet_callbacks.chat_updated, __bnet_map);
					}
	 																		
			 		_bnet_logger("SENT A MESSAGE TO EVERYONE");
				}else{
					_bnet_sendError(_bnet_tcp_socket, _bnet_write_buffer, "100");
												
					_bnet_logger("FAILED TO SEND A MESSAGE TO EVERYONE INVALID ID");
				}
			}else{
				var __bnet_client = _bnet_server_client_map[? __bnet_client_id];
											
				if(__bnet_client != undefined){
					buffer_seek(_bnet_write_buffer, buffer_seek_start, 0);
	 																		
			 		buffer_write(_bnet_write_buffer, buffer_s8,		1);
			 		buffer_write(_bnet_write_buffer, buffer_s8,		0);
				
					_bnet_client_serialize(_bnet_write_buffer, _bnet_server_local_client_map);
				
					buffer_write(_bnet_write_buffer, buffer_string, __bnet_list_id);
			 		buffer_write(_bnet_write_buffer, buffer_string, __bnet_message);
												
					if(__bnet_client != _bnet_server_client_map) _bnet_network_send_raw(_bnet_id, __bnet_client[? "socket"], _bnet_write_buffer, buffer_tell(_bnet_write_buffer));
				
					_bnet_logger("CHAT UPDATED");
							
					buffer_seek(_bnet_write_buffer, buffer_seek_start, 2);
												
					var __bnet_map			= _bnet_client_deserialize(_bnet_write_buffer);
					__bnet_map[? "list"]	= __bnet_list_id;
					__bnet_map[? "message"]	= __bnet_message;
									
					_bnet_callback_push(bnet_callbacks.chat_updated, __bnet_map);
	 																		
			 		_bnet_logger("SENT A MESSAGE TO A CLIENT");
				}else{
					_bnet_sendError(_bnet_tcp_socket, _bnet_write_buffer, "101");
												
					_bnet_logger("A CLIENT FAILED TO SEND A MESSAGE TO CLIENT INVALID ID");
				}
			}
		}else{
			buffer_seek(_bnet_write_buffer,  buffer_seek_start, 0);
		
			buffer_write(_bnet_write_buffer, buffer_s8,		1);
			buffer_write(_bnet_write_buffer, buffer_s8,		0);
			buffer_write(_bnet_write_buffer, buffer_string, argument[0]);
			buffer_write(_bnet_write_buffer, buffer_string,	__bnet_list_id);
			buffer_write(_bnet_write_buffer, buffer_string,	__bnet_client_id);
						
			_bnet_network_send_raw(_bnet_id, _bnet_tcp_socket, _bnet_write_buffer, buffer_tell(_bnet_write_buffer));
		
			_bnet_logger("CHAT MESSAGE SENT");
		}
	}


}
