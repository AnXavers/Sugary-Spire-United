/// @function bnet_instance_create(x, y, depth/layer, obj, id, *data, *cache, *room_id, *self)
function bnet_instance_create() {

	/*	@description	  						Request to create an instance to all clients within the room.
								
												TYPES: "m" = type_map, "l" = type_list, "p" = type_priority, "q" = type_queue, "g" = type_grid, 
												"s" = type_stack, "a" = array, "" = other pointer or do not sync variable.
	*/

	/// @param {real}			x				The x position the object will be created at.
	/// @param {real}			y				The y position the object will be created at.
	/// @param {real/string}	depth/layer		The depth to assign the created instance to.
	/// @param {real}			obj				The object index of the object to create an instance of.
	/// @param {string}			id				The unique id to assign the created instance to.
	/// @param {array}			data			*OPTIONAL Variables you wish to have updated upon creation. Similar effect to with(instance_create_depth()){}. Suggested to use bnet_instance_init_data(); DEFAULT: []
	/// @param {bool}			cache			*OPTIONAL Cache this instance on the server. Useful for when wanting to load in instances. DEFAULT: false. BEWARE DESTROY WHEN DONE!!!
	/// @param {string}			room_id			*OPTIONAL Room id you wish to create the instance. DEFAULT: bnet("room_id").
	/// @param {bool}			self			*OPTIONAL Should also request to send this instance back to myself.

	/// @call-back								instance_created

	/// @error-codes							"300", "301"

#region Example
	/*
		bnet_instance_create(x, y, depth, BNET_DEMO_OBJECT_PLAYER, bnet("id"), [], true, bnet("room"), true);
	
		case bnet_callbacks.instance_created:
			var 
			id_	 = bnet_callback_load[? "id"],
			inst = global.instance_map[? id_];
			
			if(inst == undefined || !instance_exists(inst)){
				inst = bnet_instance_deserialize(bnet_callback_load);
				
				if(id_ != "") global.instance_map[? id_] = inst;
			}
		break;
	*/
#endregion

	with(BNET_NETWORKMANAGER.id){
		var 
		__bnet_id		= argument[4],
		__bnet_cache	= argument_count > 6? argument[6]: false,
		__bnet_room_id	= argument_count > 7? argument[7]: _bnet_room_id,
		__bnet_self		= argument_count > 8? argument[8]: true;
	
		_bnet_instance_create(argument[0], argument[1], argument[2], argument[3], __bnet_id, argument_count > 5? argument[5]: [], __bnet_cache, __bnet_room_id, __bnet_self);
	
	#region CLIENT
		if(_bnet_type == 1) _bnet_network_send_raw(_bnet_id, _bnet_tcp_socket, _bnet_write_buffer, buffer_tell(_bnet_write_buffer));
		else{
	#endregion
	#region SERVER
			if(__bnet_room_id != ""){
				//Confirm room exists.
				var __bnet_room = _bnet_server_room_map[? __bnet_room_id];
			
				if(__bnet_room != undefined){
					//If requests to cache the instance.
					if(__bnet_cache){
						//Store it within hashmap.
						if(ds_map_find_value(__bnet_room[? "instance_map"], __bnet_id) == undefined){
							buffer_resize(_bnet_write_buffer, buffer_tell(_bnet_write_buffer));
						
							buffer_seek(_bnet_write_buffer, buffer_seek_start, 5 + string_length(__bnet_room_id));
						
							var __bnet_instance = _bnet_instance_deserialize(_bnet_write_buffer);
					
							ds_map_add(__bnet_room[? "instance_map"], __bnet_id, __bnet_instance);
					
							ds_list_add(__bnet_room[? "instance_list"], __bnet_instance);
					
							_bnet_logger_client(_bnet_id, "created an instance");
						
							if(_bnet_network_send_broadcast_tcp(__bnet_room[? "client_list"], _bnet_write_buffer, undefined) && __bnet_self){
								var __bnet_copy = ds_map_create();
							
								ds_map_copy(__bnet_copy, __bnet_instance);
							
								_bnet_callback_push(bnet_callbacks.instance_created, __bnet_copy);
							}
						}else{
							_bnet_sendError(_bnet_tcp_socket, _bnet_write_buffer, "300");
		 																		
				 			_bnet_logger_client(_bnet_id, "FAILED TO CREATE AN INSTANCE. INSTANCE ALREADY EXISTS");
						}
					}
				}else{
					var __bnet_buffer = buffer_create(1, buffer_grow, 1);
	 		
					_bnet_sendError(_bnet_tcp_socket, __bnet_buffer, "301");
	 		
					buffer_delete(__bnet_buffer);
			
			 		_bnet_logger_client(_bnet_id, "FAILED TO CREATE AN INSTANCE. ROOM NOT FOUND");
				}
			}else{
				var __bnet_buffer = buffer_create(1, buffer_grow, 1);
	 		
				_bnet_sendError(_bnet_tcp_socket, __bnet_buffer, "301");
	 		
				buffer_delete(__bnet_buffer);
			
		 		_bnet_logger_client(_bnet_id, "FAILED TO CREATE AN INSTANCE. NOT WITHIN A ROOM");
		 	}
		}
	#endregion
	
		_bnet_logger("INSTANCE CREATE SENT");
	}


}
