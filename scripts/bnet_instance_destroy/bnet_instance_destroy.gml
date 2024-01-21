/// @function bnet_instance_destroy(*id, *room_id)
function bnet_instance_destroy() {

	/// @description				Request to destroy a instance on other clients.

	/// @param {string} *id			OPTIONAL The instance id to destroy. DEFAULT: self
	/// @param {string} *room_id	OPTIONAL Room the instance is within. DEFAULT: current room.

	/// @call-back					instance_destroyed

	/// @error-codes				"302", "303"

#region Examples
	/*
		bnet_instance_destroy(bnet("id"));
	
		case bnet_callbacks.instance_destroyed:
			var 
			id_	 = bnet_callback_load[? "id"],
			inst = global.instance_map[? id_];
		
			if(id_ != bnet("id")){
				if(inst != undefined && instance_exists(inst)) instance_destroy(inst);
			
				ds_map_delete(global.instance_map, id_);
			}
		break;
	*/
#endregion

#region Code
	with(BNET_NETWORKMANAGER.id){
	#region SERVER
		if(_bnet_type == 0){
			var 
			__bnet_room_id	= argument_count > 1? argument[1]: _bnet_room_id,
			__bnet_room		= _bnet_server_room_map[? __bnet_room_id];
		
			if(__bnet_room != undefined){
				var
				__bnet_inst_id	= argument_count > 0? argument[0]: other.bnet_info[? "id"],
				__bnet_instance	= ds_map_find_value(__bnet_room[? "instance_map"], __bnet_inst_id);
										
				if(__bnet_instance != undefined){
					ds_map_delete(__bnet_room[? "instance_map"], __bnet_inst_id);
				
					ds_list_delete(__bnet_room[? "instance_list"], ds_list_find_index(__bnet_room[? "instance_list"], __bnet_instance));
											
					ds_map_destroy(__bnet_instance);
				
					buffer_resize(_bnet_write_buffer, 4 + string_length(__bnet_inst_id) + string_length(__bnet_room_id));
				
					buffer_seek(_bnet_write_buffer , buffer_seek_start, 0);
		
					buffer_write(_bnet_write_buffer, buffer_s8,  3);
					buffer_write(_bnet_write_buffer, buffer_s8,  1);
				
					buffer_write(_bnet_write_buffer, buffer_string, __bnet_room_id);
				
					buffer_write(_bnet_write_buffer, buffer_string, __bnet_inst_id);
				
					if(_bnet_network_send_broadcast_tcp(__bnet_room[? "client_list"], _bnet_write_buffer, undefined)){
				
						var __bnet_map		= ds_map_create();
						__bnet_map[? "id"]	= __bnet_inst_id;
									
						_bnet_callback_push(bnet_callbacks.instance_destroyed, __bnet_map);
					}						
				
					_bnet_logger_client(_bnet_id, "destroyed an instance");
				}else{
					_bnet_sendError(_bnet_tcp_socket, _bnet_write_buffer, "302");
											
					_bnet_logger_client(_bnet_id, "failed to destroy an instance. invalid id");
				}
			}else{
				_bnet_sendError(_bnet_tcp_socket, _bnet_write_buffer, "303");
	 																	
		 		_bnet_logger_client(_bnet_id, "FAILED TO DESTROY AN INSTANCE. NOT WITHIN A ROOM");
			}
	#endregion
	#region CLIENT
		}else{
			buffer_seek(_bnet_write_buffer , buffer_seek_start, 0);
		
			buffer_write(_bnet_write_buffer, buffer_s8,  3);
			buffer_write(_bnet_write_buffer, buffer_s8,  1);
		
			buffer_write(_bnet_write_buffer, buffer_string, argument_count > 1? argument[1]: _bnet_room_id);
		
			buffer_write(_bnet_write_buffer, buffer_string, argument_count > 0? argument[0]: other.bnet_info[? "id"]);
		
			_bnet_network_send_raw(_bnet_id, _bnet_tcp_socket, _bnet_write_buffer, buffer_tell(_bnet_write_buffer));
		
			_bnet_logger("INSTANCE DESTROY REQUEST SENT");
		}
	#endregion
	}
#endregion


}
