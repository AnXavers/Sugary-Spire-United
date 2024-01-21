/// @function bnet_instance_create_depth(x, y, depth, obj, id, *data, *cache, *room_id)
function bnet_instance_create_depth() {

	/*	@description	  			Request to create an instance to all clients within the room.

									Due to this function requesting to create a local instance an instance's id will be returned
									even if its already cached on the server and failed to transmit to other.
								
									TYPES: "m" = type_map, "l" = type_list, "p" = type_priority, "q" = type_queue, "g" = type_grid, 
									"s" = type_stack, "a" = array, "" = other pointer or do not sync variable.
								
									Beware of memory leaks. ensure to destroy when done.
	*/

	/// @param {real}	x			The x position the object will be created at.
	/// @param {real}	y			The y position the object will be created at.
	/// @param {real}	depth		The depth to assign the created instance to.
	/// @param {real}	obj			The object index of the object to create an instance of.
	/// @param {string}	id			The unique id to assign the created instance to.
	/// @param {array}	data		*OPTIONAL Variables you wish to have updated upon creation. Similar effect to with(instance_create_depth()){}. Suggested to use bnet_instance_init_data(); DEFAULT: []
	/// @param {bool}	cache		*OPTIONAL Cache this instance on the server. Useful for when wanting to load in instances. DEFAULT: false. BEWARE DESTROY WHEN DONE!!!
	/// @param {string} room_id		*OPTIONAL Room id you wish to create the instance. DEFAULT: bnet("room_id").

	/// @returns {real}				instance_id

	/// @call-back					instance_created

	/// @error-codes				"300", "301"

#region Example
	/*
		player = bnet_instance_create_depth(x, y, depth, BNET_DEMO_OBJECT_PLAYER, bnet("id"), [], true);
	*/
#endregion

	with(BNET_NETWORKMANAGER.id){
		var 
		__bnet_id		= argument[4],
		__bnet_cache	= argument_count > 6? argument[6]: false,
		__bnet_room_id	= argument_count > 7? argument[7]: _bnet_room_id;
	
		_bnet_instance_create(argument[0], argument[1], argument[2], argument[3], __bnet_id, argument_count > 5? argument[5]: [], __bnet_cache, __bnet_room_id, true);
	
		buffer_seek(_bnet_write_buffer, buffer_seek_start, 5 + string_length(__bnet_room_id));
	
		var 
		__bnet_instance				= _bnet_instance_deserialize(_bnet_write_buffer),
		__bnet_returned_instance	= bnet_instance_deserialize(__bnet_instance);
	
	#region CLIENT
		if(_bnet_type == 1) {
			ds_map_destroy(__bnet_instance);
		
			_bnet_network_send_raw(_bnet_id, _bnet_tcp_socket, _bnet_write_buffer, buffer_tell(_bnet_write_buffer));
		}else{
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
					
							ds_map_add(__bnet_room[? "instance_map"], __bnet_id, __bnet_instance);
					
							ds_list_add(__bnet_room[? "instance_list"], __bnet_instance);
					
							_bnet_logger_client(_bnet_id, "created an instance");
						}else{
							ds_map_destroy(__bnet_instance);
					
							_bnet_sendError(_bnet_tcp_socket, _bnet_write_buffer, "300");
		 																		
				 			_bnet_logger_client(_bnet_id, "FAILED TO CREATE AN INSTANCE. INSTANCE ALREADY EXISTS");
						
							return __bnet_returned_instance;
						}
					}else ds_map_destroy(__bnet_instance);
	
					buffer_resize(_bnet_write_buffer, buffer_tell(_bnet_write_buffer));
				
					_bnet_network_send_broadcast_tcp(__bnet_room[? "client_list"], _bnet_write_buffer, _bnet_server_local_client_map);
				}else{
					ds_map_destroy(__bnet_instance);
			
					var __bnet_buffer = buffer_create(1, buffer_grow, 1);
	 		
					_bnet_sendError(_bnet_tcp_socket, __bnet_buffer, "301");
	 		
					buffer_delete(__bnet_buffer);
			
			 		_bnet_logger_client(_bnet_id, "FAILED TO CREATE AN INSTANCE. ROOM NOT FOUND");
				}
			}else{
				ds_map_destroy(__bnet_instance);
			
				var __bnet_buffer = buffer_create(1, buffer_grow, 1);
	 		
				_bnet_sendError(_bnet_tcp_socket, __bnet_buffer, "301");
	 		
				buffer_delete(__bnet_buffer);
			
		 		_bnet_logger_client(_bnet_id, "FAILED TO CREATE AN INSTANCE. NOT WITHIN A ROOM");
		 	}
		}
	#endregion
	
		_bnet_logger("INSTANCE CREATE SENT");
	
		return __bnet_returned_instance;
	}


}
