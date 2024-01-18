/// @function bnet_room_goto(room, *clean_up)
function bnet_room_goto() {

	/*  @description				Sends a request to switch rooms. If the room doesnt exists one is created.
							
									Note to prevent memory leak clean_up should be set to true. To have the
									the room auto destroyed when empty.
								
									If wish to do so after you can use bnet_room_update() to set cleanup to true.
								
									Also this event is normally triggered before the gml room start event.		
	*/

	/// @param {string} room		Room id to switch to. Suggested to use game maker string(roomid). Enter "-1" to exit room.
	/// @param {bool} *clean_up		OPTIONAL Allow the server to destroy the room when empty. Prevents memory leak. DEFAULT: true.

	/// @call-back					room_joined, room_lefted

	/// @error-codes				"200", "201"

#region Example
	/*
		bnet_room_goto(string(BNET_DEMO_ROOM_GAME_2), true);
	
		case bnet_callbacks.room_joined:
			var
			//Room id.
			room_id		= bnet_callback_load[? "id"],
			
			room_goto_	= (room_id != ""? real(room_id): BNET_DEMO_ROOM_MAIN),
			
			//Returns a ds_list with the ids of the instance as the key.
			instances	= bnet_callback_load[? "instance_map"],
			clients		= bnet_callback_load[? "client_map"];
			
			//Update list of clients.
			for (var k = ds_map_find_first(clients); !is_undefined(k); k = ds_map_find_next(clients, k)) {
		
				//Copy map over.
				var copy = ds_map_create();
				ds_map_copy(copy, clients[? k]);
		
				global.room_client_map[? ds_map_find_value(clients[? k], "id")] = copy;
			}
			
			//Go to room.
			room_goto(room_goto_);
		
			//If my instance already exists. Request to create it on clients.
			if(my_inst != undefined && instance_exists(my_inst)) bnet_instance_create(my_inst.x, my_inst.y, my_inst.depth, BNET_DEMO_OBJECT_PLAYER, my_id, [], true, bnet("room"), false);
			else global.instance_map[? my_id] = bnet_instance_create_depth(room_width/2, room_height/2, -99, BNET_DEMO_OBJECT_PLAYER, my_id, [], true);
	
			//Create all other instances
			for (var k = ds_map_find_first(instances); !is_undefined(k); k = ds_map_find_next(instances, k)) {
				var inst = instances[? k];
				
				//If the instance belong to me skip it.
				if(inst[? "id"] != my_id) global.instance_map[? inst[? "id"]] = bnet_instance_deserialize(inst);
			}
		break;
	*/
#endregion

	var 
	__bnet_room_goto = argument[0],
	__bnet_cleanup	 = (argument_count > 1? argument[1]: true);

	with(BNET_NETWORKMANAGER.id){
	#region SERVER
		if(_bnet_type == 0){
			//Remove myself from previous room if in one.
			if(_bnet_server_local_room_map != undefined){
			
				if(__bnet_room_goto == _bnet_server_local_room_map[? "id"]) {
					_bnet_sendError(_bnet_tcp_socket, _bnet_write_buffer, "200");
											
					_bnet_logger_client(_bnet_id, "FAILED TO SWAP ROOM, CANT SWITCH INTO SAME ROOM");
				
					break;
				}
			
				//Remove client from room client list, and map.
				ds_list_delete(_bnet_server_local_room_list, ds_list_find_index(_bnet_server_local_room_list, _bnet_server_local_client_map));
			
				ds_map_delete(_bnet_server_local_room_map[? "client_map"], _bnet_id);
			
				//If room empty.
				if(ds_list_empty(_bnet_server_local_room_list)){
					//And it set to destroy clean it up.
					if(_bnet_server_local_room_map[? "destroy"]){
						_bnet_room_cleanup(_bnet_server_local_room_map);
									
						_bnet_logger("Room auto destroyed due to being empty");
					}
				}else{
					//Check to see if i was host if so pick another client, based on their ping.
					if(_bnet_server_local_room_map[? "host"] == _bnet_server_local_client_map){
						var 
						__bnet_host = _bnet_server_local_room_list[| 0],
						__bnet_ping = __bnet_host[? "ping"],
						__bnet_size = ds_list_size(_bnet_server_local_room_list);
			
						//Search for lowest ping
						for(var i = 0; i < __bnet_size; i++){
							var __bnet_client_ = _bnet_server_local_room_list[| 0];
				
							if(__bnet_client_[? "ping"] < __bnet_ping) __bnet_host = __bnet_client_;
						}
			
						_bnet_server_local_room_map[? "host"] = __bnet_host;
					}
									
					//Notfiy all clients within my room that i left.
					buffer_seek(_bnet_write_buffer, buffer_seek_start, 0);
	 															
			 		buffer_write(_bnet_write_buffer, buffer_s8, 2);
			 		buffer_write(_bnet_write_buffer, buffer_s8, 2);
	 															
			 		_bnet_client_serialize(_bnet_write_buffer,  _bnet_server_local_client_map);
				
					buffer_write(_bnet_write_buffer, buffer_string, ds_map_find_value(_bnet_server_local_room_map[? "host"], "id"));
	 															
			 		buffer_resize(_bnet_write_buffer, buffer_tell(_bnet_write_buffer));
	 															
			 		_bnet_network_send_broadcast_tcp(_bnet_server_local_room_list, _bnet_write_buffer, undefined);
				}
			
				//Check to see if client wishes to leave room.
				if(__bnet_room_goto == "-1") {
									
					_bnet_server_local_client_map[? "room"] = undefined;
			
					_bnet_server_local_room_map				= undefined;
			
					_bnet_server_local_room_list			= undefined;
				
					_bnet_room_id							= "";
				
					_bnet_info[? "room"]					= "";
			
					_bnet_room_host							= "";

					_bnet_info[? "room_host"]				= "";
			
					_bnet_logger_client(_bnet_id, "Lefted room");
									
					_bnet_callback_push(bnet_callbacks.room_lefted);
									
					break;
				}
			}else if(__bnet_room_goto == "-1") {
				_bnet_sendError(_bnet_tcp_socket, _bnet_write_buffer, "201");
											
				_bnet_logger_client(_bnet_id, "FAILED TO LEAVE ROOM, ALREADY LEFT");
								
				break;
			}
		
			//Search to see if room exists.
			var __bnet_room = _bnet_server_room_map[? __bnet_room_goto];
								
			if(__bnet_room != undefined){
				//Notify all clients within my room that i joined.
									
				buffer_seek(_bnet_write_buffer, buffer_seek_start, 0);
	 															
		 		buffer_write(_bnet_write_buffer, buffer_s8, 2);
		 		buffer_write(_bnet_write_buffer, buffer_s8, 1);
	 															
		 		_bnet_client_serialize(_bnet_write_buffer,  _bnet_server_local_client_map);
	 															
		 		buffer_resize(_bnet_write_buffer, buffer_tell(_bnet_write_buffer));
	 															
		 		_bnet_network_send_broadcast_tcp(__bnet_room[? "client_list"], _bnet_write_buffer, undefined);
								
			}else{
				//else create it.
				__bnet_room										= ds_map_create();
				__bnet_room[? "id"]								= __bnet_room_goto;
				__bnet_room[? "host"]							= _bnet_server_local_client_map;
				__bnet_room[? "client_list"]					= ds_list_create();
				__bnet_room[? "client_map"]						= ds_map_create();
				__bnet_room[? "instance_list"]					= ds_list_create();
				__bnet_room[? "instance_map"]					= ds_map_create();
				__bnet_room[? "destroy"]						= __bnet_cleanup;
									
				//Add room to server room cache.
				_bnet_server_room_map[? __bnet_room_goto]		= __bnet_room;
			
				//Used for cleaning up on destroy.
				ds_list_add(_bnet_server_room_list, __bnet_room);			
			
				_bnet_room_host									= _bnet_id;
				_bnet_info[? "room_host"]						= _bnet_id;
									
				//Add room client list to list hashmap.
				_bnet_server_list_map[? __bnet_room_goto]		= __bnet_room[? "client_list"];
			}
		
			//Add myself to room.
			ds_list_add(__bnet_room[? "client_list"], _bnet_server_local_client_map);
								
			ds_map_add(__bnet_room[? "client_map"], _bnet_id, _bnet_server_local_client_map);
								
			//Update client room;
			_bnet_server_local_client_map[? "room"]	= __bnet_room;
		
			_bnet_server_local_room_map				= __bnet_room;
		
			_bnet_server_local_room_list			= __bnet_room[? "client_list"];
		
			buffer_seek(_bnet_write_buffer, buffer_seek_start, 0);
		
			_bnet_client_list_serialize(_bnet_server_local_room_list, _bnet_write_buffer);
		
			_bnet_instance_list_serialize(_bnet_server_local_room_map[? "instance_list"], _bnet_write_buffer);
		
			buffer_seek(_bnet_write_buffer, buffer_seek_start, 0);
		
			var
			__bnet_host								= ds_map_find_value(__bnet_room[? "host"], "id"),
			__bnet_client_vec2						= _bnet_client_list_deserialize(_bnet_write_buffer),
			__bnet_inst_vec2						= _bnet_instance_list_deserialize(_bnet_write_buffer),
			__bnet_event_map						= ds_map_create();
										
			_bnet_room_id							= __bnet_room_goto;
			_bnet_info[? "room"]					= _bnet_room_id;
		
			_bnet_room_host							= __bnet_host;
			_bnet_info[? "room_host"]				= __bnet_host;
										
			__bnet_event_map[? "id"]				= __bnet_room_goto;
			__bnet_event_map[? "host"]				= __bnet_host;
						
			__bnet_event_map[? "client_map"]		= __bnet_client_vec2[0];
			__bnet_event_map[? "client_list"]		= __bnet_client_vec2[1];
									
			__bnet_event_map[? "instance_map"]		= __bnet_inst_vec2[0];
			__bnet_event_map[? "instance_list"]		= __bnet_inst_vec2[1];
										
			_bnet_logger_client(_bnet_id, "Swapped room");
										
			_bnet_callback_push(bnet_callbacks.room_joined, __bnet_event_map);
		}else{
	#endregion
	#region CLIENT
			buffer_seek(_bnet_write_buffer,		buffer_seek_start, 0);
		
			buffer_write(_bnet_write_buffer,	buffer_s8,		2);
			buffer_write(_bnet_write_buffer,	buffer_s8,		0);
			buffer_write(_bnet_write_buffer,	buffer_string,	__bnet_room_goto);
			buffer_write(_bnet_write_buffer,	buffer_bool,	__bnet_cleanup);
	
			_bnet_network_send_raw(_bnet_id, _bnet_tcp_socket, _bnet_write_buffer, buffer_tell(_bnet_write_buffer));
		
			_bnet_logger("SWAP ROOM SENT");
		}
	#endregion
	}


}
