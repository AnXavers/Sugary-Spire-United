/// @function bnet_instance_update_npc(*tick_rate, *room_id, *reliable);
function bnet_instance_update_npc() {

	/*	@description					Updates an instance every tick-rate, use bnet_instance_update_apply()
										to apply the update to the instance.
	*/

	/// @param {real}	*tick_rate		OPTIONAL Set to a value at which to send data. Enter a value less than zero to not send update. DEFAULT: 10.
	/// @param {string} *room_id		OPTIONAL Room id of the instance you wish to update. DEFAULT: bnet("room");
	/// @param {bool}	*reliable		OPTIONAL Set whether to use tcp, or udp. If using websocket reliable is true. DEFAULT: false.

	/// @return {real}					Returns 2 when data is sent, 1 if local, or 0 if instance belongs to remote client, -1 if BNet isnt initiated.

	/// @call-back						instance_updated

	/// @error-codes					"305", "306"

#region Example
	/*
		is_local = bnet_instance_update_npc(is_move? 1: -1, bnet("room"));
	
		case bnet_callbacks.instance_updated:
			var 
			id_		= bnet_callback_load[? "id"],
			inst	= global.instance_map[? id_];
			
			if(inst != undefined && instance_exists(inst)) bnet_instance_update_apply(inst, bnet_callback_load[? "buffer"]);
		break;
	*/
#endregion

	if(!instance_exists(BNET_NETWORKMANAGER) || bnet_info == -1) return -1;

	var
	__BNET			 = BNET_NETWORKMANAGER.id,
	__bnet_is_local	 = __BNET._bnet_room_host == __BNET._bnet_id;

#region Local
	if(__bnet_is_local){
		var __bnet_tick_rate = argument_count > 0? argument[0]: 10;
	
		if(__bnet_tick_rate < 0) return 2;
	
		bnet_info[? "timer"]++;
	
		if(bnet_info[? "timer"] < __bnet_tick_rate) return 1;
	
		bnet_info[? "timer"] = 0;
	
		var
		__bnet_room_id	= argument_count > 1? argument[1]: __BNET._bnet_room_id,
		__bnet_reliable	= argument_count > 2? argument[2]: (_bnet_is_ws? true: false),
		__bnet_buffer	= bnet_info[? "write_buffer"],
		__bnet_array	= bnet_info[? "variable_list"],
	
		__bnet_size_	= (array_length_2d(__bnet_array, 0) > 0? array_height_2d(__bnet_array): 0);

		buffer_seek(__bnet_buffer, buffer_seek_start, 0);

		buffer_write(__bnet_buffer, buffer_s8,			3);
		buffer_write(__bnet_buffer, buffer_s8,			3);
		buffer_write(__bnet_buffer, buffer_string,		__bnet_room_id);
		buffer_write(__bnet_buffer, buffer_string,		bnet_info[? "id"]);
		buffer_write(__bnet_buffer, buffer_string,		object_get_name(object_index));
		buffer_write(__bnet_buffer, buffer_string,		sprite_get_name(sprite_index));
	
		buffer_write(__bnet_buffer, buffer_s32,			x);
		buffer_write(__bnet_buffer, buffer_s32,			y);

		for(var i = 0; i < __bnet_size_; i++;){
			//If variable time expires sync variable.
			if(__bnet_array[i, 4] <= 0){
				var 
				__bnet_var_name		= __bnet_array[i, 0],
				__bnet_var_type		= __bnet_array[i, 1],
				__bnet_buffer_type	= __bnet_array[i, 2];
						
				//Send which variable to sync
				buffer_write(__bnet_buffer, buffer_string,	__bnet_var_name);
				buffer_write(__bnet_buffer, buffer_string,	__bnet_var_type);
				buffer_write(__bnet_buffer, buffer_u8,		__bnet_buffer_type);
						
				switch(__bnet_var_type){
					case "a":
						var 
						__bnet_string		= __bnet_var_name,
						__bnet_comma		= string_pos("," , __bnet_string),
						__bnet_var_name_	= string_copy(__bnet_string, 1, __bnet_comma - 1),
						__bnet_string_		= string_copy(__bnet_string, __bnet_comma + 1, string_length(__bnet_string)),
						__bnet_comma_		= string_pos("," , __bnet_string_),
						__bnet_index		= real(string_copy(__bnet_string_, 1, max(1, __bnet_comma_ - 1))),
						__bnet_column		= (__bnet_comma_ != 0? real(string_copy(__bnet_string_, __bnet_comma_ + 1, string_length(__bnet_string_))): -1);
													
						if(__bnet_comma != 0){
							var __bnet_variable = variable_instance_get(id, __bnet_var_name_);
						
							if(__bnet_column == -1) buffer_write(__bnet_buffer, __bnet_buffer_type, __bnet_variable[__bnet_index]);
							else buffer_write(__bnet_buffer, __bnet_buffer_type, __bnet_variable[__bnet_index, __bnet_column]);
						
						}else show_error("Instance variable sync failed, invalid __bnet_array pointer. Missing comma 1", true);
					break;
					case "m": buffer_write(__bnet_buffer, buffer_string,		ds_map_write(variable_instance_get(id, __bnet_var_name)));		break;
					case "l": buffer_write(__bnet_buffer, buffer_string,		ds_list_write(variable_instance_get(id, __bnet_var_name)));		break;
					case "p": buffer_write(__bnet_buffer, buffer_string,		ds_priority_write(variable_instance_get(id, __bnet_var_name)));	break;
					case "q": buffer_write(__bnet_buffer, buffer_string,		ds_queue_write(variable_instance_get(id, __bnet_var_name)));	break;
					case "g": buffer_write(__bnet_buffer, buffer_string,		ds_grid_write(variable_instance_get(id, __bnet_var_name)));		break;
					case "s": buffer_write(__bnet_buffer, buffer_string,		ds_stack_write(variable_instance_get(id, __bnet_var_name)));	break;
					default:  buffer_write(__bnet_buffer, __bnet_buffer_type,	variable_instance_get(id, __bnet_var_name));					break;
				}
						
				//Set variable timer back to default.
				__bnet_array[@ i, 4] = __bnet_array[i, 3];
			}
					
			//Decrease variable timer.
			__bnet_array[@ i, 4]--;
		}

	#region Send data
		with(__BNET){
			if(!__bnet_reliable){
				buffer_resize(__bnet_buffer, buffer_tell(__bnet_buffer));
			
				if(_bnet_type == 0){
				
					var __bnet_room = _bnet_server_room_map[? __bnet_room_id];
				
					if(__bnet_room != undefined){
					
						if(_bnet_network_send_broadcast_udp(_bnet_id, __bnet_room[? "client_list"], __bnet_buffer, undefined)){
							buffer_seek(__bnet_buffer, buffer_seek_start, 3 + string_length(__bnet_room_id));
				
							var 
							__bnet_map						= ds_map_create();
							__bnet_map[? "id"]				= buffer_read(__bnet_buffer, buffer_string);
				
							var 
							__bnet_obj_index				= buffer_read(__bnet_buffer, buffer_string),
							__bnet_spr_index				= buffer_read(__bnet_buffer, buffer_string);
				
							__bnet_map[? "object_index"]	= asset_get_index(__bnet_obj_index);
							__bnet_map[? "sprite_index"]	= asset_get_index(__bnet_spr_index);
							__bnet_map[? "x"]				= buffer_read(__bnet_buffer, buffer_s32);
							__bnet_map[? "y"]				= buffer_read(__bnet_buffer, buffer_s32);
				
							var
							__bnet_offset					= buffer_tell(__bnet_buffer),
							__bnet_size						= buffer_get_size(__bnet_buffer) - __bnet_offset,
							__bnet_buffer_					= buffer_create(__bnet_size, buffer_grow, 1);
									
							__bnet_map[? "buffer"]			= __bnet_buffer_;
									
							buffer_copy(__bnet_buffer, __bnet_offset, __bnet_size, __bnet_buffer_, 0);
												
							buffer_seek(__bnet_buffer_, buffer_seek_start, 0);
	
							_bnet_callback_push(bnet_callbacks.instance_updated, __bnet_map);
				
							//Update instance
							var __bnet_instance	= ds_map_find_value(__bnet_room[? "instance_map"], other.bnet_info[? "id"]);
				
							if(__bnet_instance != undefined){
								//Can perform collision checks here.
								__bnet_instance[? "object_index"]	= __bnet_obj_index;
								__bnet_instance[? "sprite_index"]	= __bnet_spr_index;
							 	__bnet_instance[? "x"]				= other.x;
							 	__bnet_instance[? "y"]				= other.y;
							}
						}
					}else{
						_bnet_sendError(_bnet_tcp_socket, _bnet_write_buffer, "305");
		 																
				 		_bnet_logger_client(_bnet_id, "FAILED TO UPDATE AN INSTANCE. NOT WITHIN A ROOM, or invalid room id");
					}
				}else _bnet_network_send_udp_raw(_bnet_id, _bnet_udp_socket, _bnet_ip, _bnet_server_udp_port, __bnet_buffer, _bnet_mtu, _bnet_ping, _bnet_congestion_thresh);
			}else{
				if(_bnet_type == 0){
					var __bnet_room = _bnet_server_room_map[? __bnet_room_id];
				
					if(__bnet_room != undefined){
						buffer_resize(__bnet_buffer, buffer_tell(__bnet_buffer));
				
						if(_bnet_network_send_broadcast_tcp(__bnet_room[? "client_list"], __bnet_buffer, undefined)){
				
							buffer_seek(__bnet_buffer, buffer_seek_start, 3 + string_length(__bnet_room_id));
													
							var 
							__bnet_map						= ds_map_create();
							__bnet_map[? "id"]				= buffer_read(__bnet_buffer, buffer_string);
				
							var 
							__bnet_obj_index				= buffer_read(__bnet_buffer, buffer_string),
							__bnet_spr_index				= buffer_read(__bnet_buffer, buffer_string);
				
							__bnet_map[? "object_index"]	= asset_get_index(__bnet_obj_index);
							__bnet_map[? "sprite_index"]	= asset_get_index(__bnet_spr_index);
							__bnet_map[? "x"]				= buffer_read(__bnet_buffer, buffer_s32);
							__bnet_map[? "y"]				= buffer_read(__bnet_buffer, buffer_s32);
				
							var
							__bnet_offset					= buffer_tell(__bnet_buffer),
							__bnet_size						= buffer_get_size(__bnet_buffer) - __bnet_offset,
							__bnet_buffer_					= buffer_create(__bnet_size, buffer_grow, 1);
									
							__bnet_map[? "buffer"]			= __bnet_buffer_;
									
							buffer_copy(__bnet_buffer, __bnet_offset, __bnet_size, __bnet_buffer_, 0);
												
							buffer_seek(__bnet_buffer_, buffer_seek_start, 0);
	
							_bnet_callback_push(bnet_callbacks.instance_updated, __bnet_map);
				
							//Update instance
							var __bnet_instance	= ds_map_find_value(__bnet_room[? "instance_map"], other.bnet_info[? "id"]);
				
							if(__bnet_instance != undefined){
								//Can perform collision checks here.
								__bnet_instance[? "object_index"]	= __bnet_obj_index;
								__bnet_instance[? "sprite_index"]	= __bnet_spr_index;
							 	__bnet_instance[? "x"]				= other.x;
							 	__bnet_instance[? "y"]				= other.y;
							}
						}
					}else{
						_bnet_sendError(_bnet_tcp_socket, _bnet_write_buffer, "305");
		 																
				 		_bnet_logger_client(_bnet_id, "FAILED TO UPDATE AN INSTANCE. NOT WITHIN A ROOM, or invalid room id");
					}
				}else _bnet_network_send_raw(_bnet_id, _bnet_tcp_socket, __bnet_buffer, buffer_tell(__bnet_buffer));
			}
		}
	#endregion
		return 2;
	}
#endregion
	else
#region Remote
	{	
		var 
		__bnet_buffer	= bnet_info[? "read_buffer"],
		__bnet_size		= buffer_get_size(__bnet_buffer);
	
		while(buffer_tell(__bnet_buffer) < __bnet_size){
			var
			__bnet_var_name		= buffer_read(__bnet_buffer, buffer_string),
			__bnet_var_type		= buffer_read(__bnet_buffer, buffer_string),
			__bnet_buffer_type	= buffer_read(__bnet_buffer, buffer_u8);
			
			switch(__bnet_var_type){
				case "a":
					var 
					__bnet_string			= __bnet_var_name,
					__bnet_comma			= string_pos("," , __bnet_string),
					__bnet_var_name_		= string_copy(__bnet_string, 1, __bnet_comma - 1),
					__bnet_string_			= string_copy(__bnet_string, __bnet_comma + 1, string_length(__bnet_string)),
					__bnet_comma_			= string_pos("," , __bnet_string_),
					__bnet_index			= real(string_copy(__bnet_string_, 1, max(1, __bnet_comma_ - 1))),
					__bnet_column			= (__bnet_comma_ != 0? real(string_copy(__bnet_string_, __bnet_comma_ + 1, string_length(__bnet_string_))): -1);
													
					if(__bnet_comma != 0){
						var __bnet_variable = variable_instance_get(id, __bnet_var_name_);
					
						if(__bnet_column == -1) __bnet_variable[@ __bnet_index] = buffer_read(__bnet_buffer, __bnet_buffer_type);
						else __bnet_variable[@ __bnet_index, __bnet_column] = buffer_read(__bnet_buffer, __bnet_buffer_type);
					}else show_error("Instance variable initiate failed, invalid __bnet_array pointer. Missing comma 1", true);
				break;
				case "m": ds_map_read(variable_instance_get(id, __bnet_var_name),		buffer_read(__bnet_buffer, buffer_string));			break;
				case "l": ds_list_read(variable_instance_get(id, __bnet_var_name),		buffer_read(__bnet_buffer, buffer_string));			break;
				case "p": ds_priority_read(variable_instance_get(id, __bnet_var_name),	buffer_read(__bnet_buffer, buffer_string));			break;
				case "q": ds_queue_read(variable_instance_get(id, __bnet_var_name),		buffer_read(__bnet_buffer, buffer_string));			break;
				case "g": ds_grid_read(variable_instance_get(id, __bnet_var_name),		buffer_read(__bnet_buffer, buffer_string));			break;
				case "s": ds_stack_read(variable_instance_get(id, __bnet_var_name),		buffer_read(__bnet_buffer, buffer_string));			break;
				default:  variable_instance_set(id, __bnet_var_name,					buffer_read(__bnet_buffer, __bnet_buffer_type));	break;
			}
		}
	
		return 0;
	}
#endregion


}
