function _bnet_onProcess(argument0, argument1, argument2, argument3) {
	var
	__bnet_async_load	= argument0,

	__bnet_socket		= __bnet_async_load[? "id"],
	__bnet_ip			= __bnet_async_load[? "ip"],
	__bnet_port			= __bnet_async_load[? "port"],

	//Get the buffer id.
	__bnet_read_buffer	= argument1,
				
	//Get the client id who sent this.
	__bnet_client_id	= argument2,
			
	//Get whether the packet is tcp.
	__bnet_is_tcp		= argument3,
			
	__bnet_header		= buffer_read(__bnet_read_buffer, buffer_s8);
				
	//show_debug_message(_bnet_time_stamp + " Header: "+string(__bnet_header));
				
	switch(_bnet_type){
	#region SERVER
		case 0:
			var __bnet_client = _bnet_server_client_map[? __bnet_client_id];
		
			//Drop packet due to client not found. Possibly packet in transit before disconnection.
			if(__bnet_client == undefined && __bnet_header != -2 && __bnet_header != -128) break;
					
			switch(__bnet_header){
			#region REGISTRY
				case -128:
					var __bnet_client_id_ = buffer_read(__bnet_read_buffer, buffer_string);
							
					//Ensure the client isnt already connected.
					if(_bnet_server_client_map[? __bnet_client_id_] != undefined) {
					 	_bnet_sendError(__bnet_socket, _bnet_write_buffer, "000");
			 													
					 	_bnet_logger_client(__bnet_client_id_, "failed to connect already connected");
					
					 	break;
					}
							
					var 
					__bnet_client_					= ds_map_create();
					__bnet_client_[? "id"]			= __bnet_client_id_;
					__bnet_client_[? "name"]		= buffer_read(__bnet_read_buffer, buffer_string);
					__bnet_client_[? "ip"]			= __bnet_ip;
					__bnet_client_[? "socket"]		= __bnet_socket;
					__bnet_client_[? "tcp_port"]	= __bnet_port;
					__bnet_client_[? "udp_port"]	= buffer_read(__bnet_read_buffer, buffer_u16);
					__bnet_client_[? "ping"]		= 0;
					__bnet_client_[? "room"]		= undefined;
							
					_bnet_server_client_map[? __bnet_client_id_] = __bnet_client_;
				
					ds_list_add(_bnet_server_client_list, __bnet_client_);
				
					//Send connected event.
					buffer_seek(_bnet_write_buffer, buffer_seek_start, 0);
		 										
					buffer_write(_bnet_write_buffer, buffer_s8,		0);
					buffer_write(_bnet_write_buffer, buffer_s8,		0);
					buffer_write(_bnet_write_buffer, buffer_string,	_bnet_server_client_list);
							
					_bnet_client_list_serialize(_bnet_server_client_list, _bnet_write_buffer);
		 					
					_bnet_network_send_raw(_bnet_id, __bnet_socket, _bnet_write_buffer, buffer_tell(_bnet_write_buffer));
				
					//Notify all clients that i joined.
					buffer_seek(_bnet_write_buffer, buffer_seek_start, 0);
				
					buffer_write(_bnet_write_buffer, buffer_s8, 0);
					buffer_write(_bnet_write_buffer, buffer_s8, 3);
				
					_bnet_client_serialize(_bnet_write_buffer, __bnet_client_);
								
					buffer_resize(_bnet_write_buffer, buffer_tell(_bnet_write_buffer));
				
					_bnet_network_send_broadcast_tcp(_bnet_server_client_list, _bnet_write_buffer, undefined);
							
					//Send client to server local call-back.
					buffer_seek(_bnet_write_buffer, buffer_seek_start, 0);
							
					_bnet_client_serialize(_bnet_write_buffer, __bnet_client_);
							
					buffer_seek(_bnet_write_buffer, buffer_seek_start, 0);
							
					_bnet_callback_push(bnet_callbacks.client_connected, _bnet_client_deserialize(_bnet_write_buffer));
							
					_bnet_logger_client(__bnet_client_id_, "connected");
				break;
			#endregion
			#region CUSTOM BUFFER
				case -7://BROADCAST TO LIST
					var __bnet_list = _bnet_server_list_map[? buffer_read(__bnet_read_buffer, buffer_string)];
				
					//Verify that targeted list exists
					if(__bnet_list != undefined){
						if(__bnet_is_tcp){
							if(_bnet_network_send_broadcast_tcp(__bnet_list, __bnet_read_buffer, undefined)){
								_bnet_logger("received a packet");
			
								script_execute(asset_get_index("bnetOnMessage"), __bnet_read_buffer);
							}
						}else{
							if(_bnet_network_send_broadcast_udp(__bnet_client_id, __bnet_list, __bnet_read_buffer, undefined)){
								_bnet_logger("received a packet");
			
								script_execute(asset_get_index("bnetOnMessage"), __bnet_read_buffer);
							}
						}
								
						_bnet_logger_client(__bnet_client_id, "BROADCASTED A BUFFER");
					}else{
						_bnet_sendError(__bnet_socket, _bnet_write_buffer, "007");
								
						_bnet_logger_client(__bnet_client_id, "FAILED TO BROADCAST A BUFFER. INVALID LIST ID");
					}
				break;
				case -6://SEND TO CLIENT
					var c = _bnet_server_client_map[? buffer_read(__bnet_read_buffer, buffer_string)];
							
					if(c != undefined){
						if(c == _bnet_server_local_client_map){
							_bnet_logger("received a packet");
			
							script_execute(asset_get_index("bnetOnMessage"), __bnet_read_buffer);
						}else{
							if(__bnet_is_tcp) _bnet_network_send_raw(__bnet_client_id, c[? "socket"], __bnet_read_buffer, buffer_get_size(__bnet_read_buffer));
							else _bnet_network_send_udp_raw(__bnet_client_id, _bnet_udp_socket, c[? "ip"], c[? "udp_port"], __bnet_read_buffer, _bnet_mtu, c[? "ping"], _bnet_congestion_thresh);
												
							_bnet_logger_client(__bnet_client_id, " SENT A PACKET TO A CLIENT");
						}
					}else{
						_bnet_sendError(__bnet_socket, _bnet_write_buffer, "006");
								
						_bnet_logger_client(__bnet_client_id, "SENT A PACKET TO A CLIENT FAILED. INVALID CLIENT ID");
					}
				break;
			#endregion
			#region VERSION CHECK
				case -5:
					buffer_seek(_bnet_write_buffer, buffer_seek_start, 0);
							
					buffer_write(_bnet_write_buffer, buffer_s8,		-5);
					buffer_write(_bnet_write_buffer, buffer_string, _bnet_version);
							
					_bnet_network_send_raw(__bnet_client_id, __bnet_socket, _bnet_write_buffer, buffer_tell(_bnet_write_buffer));
							
					_bnet_logger_client(__bnet_client_id, "REQUESTED SERVER VERSION");
				break;
			#endregion
			#region CUSTOM EVENTS
				case -4://BROADCAST
					var __bnet_list = _bnet_server_list_map[? buffer_read(__bnet_read_buffer, buffer_string)];
				
					//Verify that targeted list exists
					if(__bnet_list != undefined){
						if(__bnet_is_tcp){
							if(_bnet_network_send_broadcast_tcp(__bnet_list, __bnet_read_buffer, undefined)){
								_bnet_logger("REQUESTED TO EXECUTE A CUSTOM EVENT");
							
								var 
								__bnet_script	= buffer_read(__bnet_read_buffer, buffer_string),
								__bnet_data		= buffer_read(__bnet_read_buffer, buffer_string);
							
								script_execute(asset_get_index(__bnet_script), __bnet_data);
							}
						}else{
							if(_bnet_network_send_broadcast_udp(__bnet_client_id, __bnet_list, __bnet_read_buffer, undefined)){
								_bnet_logger("REQUESTED TO EXECUTE A CUSTOM EVENT");
							
								var 
								__bnet_script	= buffer_read(__bnet_read_buffer, buffer_string),
								__bnet_data		= buffer_read(__bnet_read_buffer, buffer_string);
							
								script_execute(asset_get_index(__bnet_script), __bnet_data);
							}
						}
								
						_bnet_logger_client(__bnet_client_id, "BROADCASTED AN EVENT");
					}else{
						_bnet_sendError(__bnet_socket, _bnet_write_buffer, "004");
								
						_bnet_logger_client(__bnet_client_id, "FAILED TO BROADCAST AN EVENT. INVALID LIST ID");
					}
				break;
				case -3://SEND TO TARGETED CLIENT
					var c = _bnet_server_client_map[? buffer_read(__bnet_read_buffer, buffer_string)];
							
					if(c != undefined){
						if(c == _bnet_server_local_client_map){
							_bnet_logger("REQUESTED TO EXECUTE A CUSTOM EVENT");
							
							var 
							__bnet_script	= buffer_read(__bnet_read_buffer, buffer_string),
							__bnet_data		= buffer_read(__bnet_read_buffer, buffer_string);
							
							script_execute(asset_get_index(__bnet_script), __bnet_data);
						}else{
							if(__bnet_is_tcp) _bnet_network_send_raw(__bnet_client_id, c[? "socket"], __bnet_read_buffer, buffer_get_size(__bnet_read_buffer));
							else _bnet_network_send_udp_raw(__bnet_client_id, _bnet_udp_socket, c[? "ip"], c[? "udp_port"], __bnet_read_buffer, _bnet_mtu, c[? "ping"], _bnet_congestion_thresh);
												
							_bnet_logger_client(__bnet_client_id, "SENT A EVENT TO A CLIENT");
						}
					}else{
						_bnet_sendError(__bnet_socket, _bnet_write_buffer, "003");
								
						_bnet_logger_client(__bnet_client_id, "SENT A EVENT TO A CLIENT FAILED. INVALID CLIENT ID");
					}
				break;
			#endregion
			#region GML HEADER
				case -2:
					switch(buffer_read(__bnet_read_buffer, buffer_s8)){
						case 0:
							_bnet_info[? "connected"]					= true;
							_bnet_ip									= __bnet_ip;
							_bnet_udp_port								= __bnet_port;
						
							_bnet_info[? "ip" ]							= _bnet_ip;
						
							//Create server client map.
							_bnet_server_local_client_map				= ds_map_create();
							_bnet_server_local_client_map[? "id"]		= _bnet_id;
							_bnet_server_local_client_map[? "name"]		= _bnet_name;
							_bnet_server_local_client_map[? "ip"]		= _bnet_ip;
							_bnet_server_local_client_map[? "socket"]	= _bnet_tcp_socket;
							_bnet_server_local_client_map[? "tcp_port"]	= _bnet_tcp_port;
							_bnet_server_local_client_map[? "udp_port"]	= _bnet_udp_port;
							_bnet_server_local_client_map[? "ping"]		= 0;
							_bnet_server_local_client_map[? "room"]		= undefined;
						
							//Store my map within server client map.
							_bnet_server_client_map[? _bnet_id]		= _bnet_server_local_client_map;
									
							ds_list_add(_bnet_server_client_list, _bnet_server_local_client_map);
						
							buffer_seek(_bnet_write_buffer, buffer_seek_start, 0);
						
							_bnet_client_list_serialize(_bnet_server_client_list, _bnet_write_buffer);
						
							buffer_seek(_bnet_write_buffer, buffer_seek_start, 0);
						
							var 
							__bnet_client_vec2		= _bnet_client_list_deserialize(_bnet_write_buffer),
							__bnet_event_map		= ds_map_create();
						
							__bnet_event_map[? "client_map"]	= __bnet_client_vec2[0];
							__bnet_event_map[? "client_list"]	= __bnet_client_vec2[1];
		
							_bnet_callback_push(bnet_callbacks.server_created, __bnet_event_map);
						
							_bnet_logger("Server created");
						break;
					}
				break;
			#endregion
			#region PING
				case -1:
					__bnet_client[? "ping"] = buffer_read(__bnet_read_buffer, buffer_u16);
							
					//If is websocket.
					if(__bnet_is_tcp) _bnet_network_send_raw(__bnet_client_id, __bnet_client[? "socket"], __bnet_read_buffer, buffer_get_size(__bnet_read_buffer));
					else{
						var 
						b = _bnet_buffer_encode(__bnet_client_id, __bnet_read_buffer, _bnet_mtu, _bnet_connection_type),
						s = array_length_1d(b) - 1;
							
						for(var i = 0; i < s; i++){
							network_send_udp_raw(_bnet_udp_socket, __bnet_ip, __bnet_port, b[i], buffer_get_size(b[i]));
									
							buffer_delete(b[i]);
						}
					}
				break;
			#endregion
			#region CONNECTION
				case 0:
					switch(buffer_read(__bnet_read_buffer, buffer_s8)){
					#region DISCONNECT
						case 1:
							_bnet_onDisconnect(__bnet_client);
						break;
					#endregion
					}
				break;
			#endregion
			#region CHAT
				case 1:
					switch(buffer_read(__bnet_read_buffer, buffer_s8)){
					#region TEXT
						case 0:
							var
							__bnet_message	= buffer_read(__bnet_read_buffer, buffer_string),
							__bnet_list_id	= buffer_read(__bnet_read_buffer, buffer_string);
										
							if(__bnet_list_id != ""){
								var __bnet_message_list = _bnet_server_list_map[? __bnet_list_id];
											
								if(__bnet_message_list != undefined){
									buffer_seek(_bnet_write_buffer, buffer_seek_start, 0);
	 																		
			 						buffer_write(_bnet_write_buffer, buffer_s8, 1);
			 						buffer_write(_bnet_write_buffer, buffer_s8, 0);
	 																		
			 						_bnet_client_serialize(_bnet_write_buffer,  __bnet_client);
								
									buffer_write(_bnet_write_buffer, buffer_string, __bnet_list_id);
			 						buffer_write(_bnet_write_buffer, buffer_string, __bnet_message);
	 																		
			 						buffer_resize(_bnet_write_buffer, buffer_tell(_bnet_write_buffer));
	 																		
			 						if(_bnet_network_send_broadcast_tcp(__bnet_message_list, _bnet_write_buffer, undefined)){
										_bnet_logger("CHAT UPDATED");
												
										buffer_seek(_bnet_write_buffer, buffer_seek_start, 2);
												
										var __bnet_map				= _bnet_client_deserialize(_bnet_write_buffer);
										__bnet_map[? "list"]		= __bnet_list_id;
										__bnet_map[? "message"]		= __bnet_message;
									
										_bnet_callback_push(bnet_callbacks.chat_updated, __bnet_map);
									}
	 																		
			 						_bnet_logger_client(__bnet_client_id, "SENT A MESSAGE TO EVERYONE");
								}else{
									_bnet_sendError(__bnet_socket, _bnet_write_buffer, "100");
												
									_bnet_logger_client(__bnet_client_id, "FAILED TO SEND A MESSAGE TO EVERYONE INVALID ID");
								}
							}else{
								var c = _bnet_server_client_map[? buffer_read(__bnet_read_buffer, buffer_string)];
											
								if(c != undefined){
									buffer_seek(_bnet_write_buffer, buffer_seek_start, 0);
	 																		
			 						buffer_write(_bnet_write_buffer, buffer_s8, 1);
			 						buffer_write(_bnet_write_buffer, buffer_s8, 0);
								
									_bnet_client_serialize(_bnet_write_buffer, __bnet_client);
								
									buffer_write(_bnet_write_buffer, buffer_string, __bnet_list_id);
			 						buffer_write(_bnet_write_buffer, buffer_string, __bnet_message);
	 																		
			 						_bnet_network_send_raw(__bnet_client_id, __bnet_socket, _bnet_write_buffer, buffer_tell(_bnet_write_buffer));
												
									if(c != _bnet_server_client_map) _bnet_network_send_raw(__bnet_client_id, c[? "socket"], _bnet_write_buffer, buffer_tell(_bnet_write_buffer));
									else{
										_bnet_logger("CHAT UPDATED");
												
										buffer_seek(_bnet_write_buffer, buffer_seek_start, 2);
												
										var __bnet_map			= _bnet_client_deserialize(_bnet_write_buffer);
										__bnet_map[? "list"]	= __bnet_list_id;
										__bnet_map[? "message"]	= __bnet_message;
									
										_bnet_callback_push(bnet_callbacks.chat_updated, __bnet_map);	
									}
	 																		
			 						_bnet_logger_client(__bnet_client_id, "SENT A MESSAGE TO A CLIENT");
								}else{
									_bnet_sendError(__bnet_socket, _bnet_write_buffer, "101");
												
									_bnet_logger_client(__bnet_client_id, "FAILED TO SEND A MESSAGE TO CLIENT INVALID ID");
								}
							}
						break;
					#endregion
					#region VOIP
						case 1://VOIP
							var 
							__bnet_id	= buffer_read(__bnet_read_buffer, buffer_string),
							__bnet_list = _bnet_server_list_map[? __bnet_id];
									
							if (__bnet_list != undefined){
											
								buffer_seek(_bnet_write_buffer, buffer_seek_start, 0);
											
								buffer_write(_bnet_write_buffer, buffer_s8,		1);
								buffer_write(_bnet_write_buffer, buffer_s8,		1);
								buffer_write(_bnet_write_buffer, buffer_string, __bnet_id);
								buffer_write(_bnet_write_buffer, buffer_s16,	buffer_read(__bnet_read_buffer, buffer_s16));
								buffer_write(_bnet_write_buffer, buffer_u16,	buffer_read(__bnet_read_buffer, buffer_u16));
							
								var __bnet_size = buffer_read(__bnet_read_buffer, buffer_u16);
							
								buffer_write(_bnet_write_buffer, buffer_u16,	__bnet_size);
										
								_bnet_client_serialize(_bnet_write_buffer, __bnet_client);
											
								buffer_copy(__bnet_read_buffer, buffer_tell(__bnet_read_buffer), __bnet_size, _bnet_write_buffer, buffer_tell(_bnet_write_buffer));
											
								buffer_resize(_bnet_write_buffer, buffer_tell(_bnet_write_buffer) + __bnet_size);
										
								var __bnet_me = false;
										
								if(__bnet_is_tcp) __bnet_me = _bnet_network_send_broadcast_tcp(__bnet_list, _bnet_write_buffer, __bnet_client);
								else __bnet_me = _bnet_network_send_broadcast_udp(__bnet_client_id, __bnet_list, _bnet_write_buffer, __bnet_client);
										
								if(__bnet_me){
									buffer_seek(_bnet_write_buffer, buffer_seek_start, 2);
												
									var
									__bnet_list			= buffer_read(_bnet_write_buffer, buffer_string),
									__bnet_samplerate	= buffer_read(_bnet_write_buffer, buffer_s16),
									__bnet_duration		= buffer_read(_bnet_write_buffer, buffer_u16),
									__bnet_size			= buffer_read(_bnet_write_buffer, buffer_u16),
									__bnet_event_map	= _bnet_client_deserialize(_bnet_write_buffer),
									__bnet_map			= _bnet_info[? "voip"],
									__bnet_buffer		= buffer_create(__bnet_size, buffer_grow, 1);
														
									buffer_copy(_bnet_write_buffer, buffer_tell(_bnet_write_buffer), __bnet_size, __bnet_buffer, 0);
														
									var __bnet_newAudio = audio_create_buffer_sound(__bnet_buffer, buffer_s16, __bnet_samplerate, 0, __bnet_size, audio_mono);
														
									ds_list_add(__bnet_map[? "list"], __bnet_newAudio);
								
									ds_list_add(__bnet_map[? "list"], __bnet_buffer);
									
									__bnet_event_map[? "list"]			= __bnet_list;
									__bnet_event_map[? "audio"]			= __bnet_newAudio;
									__bnet_event_map[? "buffer"]		= __bnet_buffer;
									__bnet_event_map[? "sample_rate"]	= __bnet_samplerate;
									__bnet_event_map[? "tcp"]			= __bnet_is_tcp;
									__bnet_event_map[? "size"]			= __bnet_size;
									__bnet_event_map[? "duration"]		= __bnet_duration;
									
									_bnet_callback_push(bnet_callbacks.voip_updated, __bnet_event_map);
									
									_bnet_logger("VOIP UPDATED");
								}
							}else {
								_bnet_sendError(__bnet_socket, _bnet_write_buffer, "102");
										
								_bnet_logger_client(__bnet_client_id, "FAILED TO SEND A MESSAGE TO A CLIENT INVALID ID");
							}
						break;
					#endregion
					}
				break;
			#endregion
			#region ROOM
				case 2:
					switch(buffer_read(__bnet_read_buffer, buffer_s8)){
					#region GOTO
						case 0:
							var 
							__bnet_room_goto	= buffer_read(__bnet_read_buffer, buffer_string),
									
							__bnet_client_room	= __bnet_client[? "room"],
									
							__bnet_list;
								
							//Remove myself from previous room if in one.
							if(__bnet_client_room != undefined){
										
								if(__bnet_room_goto == __bnet_client_room[? "id"]) {
									_bnet_sendError(__bnet_socket, _bnet_write_buffer, "200");
											
									_bnet_logger_client(__bnet_client_id, "FAILED TO SWAP ROOM, CANT SWITCH INTO SAME ROOM");
								
									break;
								}
							
								__bnet_list = __bnet_client_room[? "client_list"];
							
								//Remove client from room client list, and map.
								ds_list_delete(__bnet_list, ds_list_find_index(__bnet_list, __bnet_client));
										
								ds_map_delete(__bnet_client_room[? "client_map"], __bnet_client_id);
							
								//If room empty.
								if(ds_list_empty(__bnet_list)){
									//And it set to destroy clean it up.
									if(__bnet_client_room[? "destroy"]){
										_bnet_room_cleanup(__bnet_client_room);
									
										_bnet_logger("Room auto destroyed due to being empty");
									}
								}else{
									//Check to see if i was host if so pick another client, based on their ping.
									if(__bnet_client_room[? "host"] == __bnet_client){
										var 
										__bnet_host = __bnet_list[| 0],
										__bnet_ping = __bnet_host[? "ping"],
										__bnet_size = ds_list_size(__bnet_list);
			
										//Search for lowest ping
										for(var i = 1; i < __bnet_size; i++){
											var __bnet_client_ = __bnet_list[| i];
				
											if(__bnet_client_[? "ping"] < __bnet_ping) __bnet_host = __bnet_client_;
										}
			
										__bnet_client_room[? "host"] = __bnet_host;
									}
									
									//Notfiy all clients within my room that i left.
									buffer_seek(_bnet_write_buffer, buffer_seek_start, 0);
	 															
						 			buffer_write(_bnet_write_buffer, buffer_s8, 2);
						 			buffer_write(_bnet_write_buffer, buffer_s8, 2);
	 															
						 			_bnet_client_serialize(_bnet_write_buffer,  __bnet_client);
									
									buffer_write(_bnet_write_buffer, buffer_string, ds_map_find_value(__bnet_client_room[? "host"], "id"));
											
									buffer_resize(_bnet_write_buffer, buffer_tell(_bnet_write_buffer));
	 															
						 			if(_bnet_network_send_broadcast_tcp(__bnet_list, _bnet_write_buffer, undefined)){
										_bnet_logger_client(__bnet_client_id, "lefted the room");
										
										buffer_seek(_bnet_write_buffer, buffer_seek_start, 2);
							
										var __bnet_copy				= _bnet_client_deserialize(_bnet_write_buffer);
										__bnet_copy[? "host"]		= buffer_read(_bnet_write_buffer, buffer_string);
												
										_bnet_room_host				= __bnet_copy[? "host"];
										_bnet_info[? "room_host"]	= _bnet_room_host;
												
										_bnet_callback_push(bnet_callbacks.room_client_lefted, __bnet_copy);
									}
								}
							
								//Check to see if client wishes to leave room.
								if(__bnet_room_goto == "-1") {
									
									__bnet_client[? "room"] = undefined;
									
									buffer_seek(_bnet_write_buffer, buffer_seek_start, 0);
	 														
							 		buffer_write(_bnet_write_buffer, buffer_s8,  2);
							 		buffer_write(_bnet_write_buffer, buffer_s8,  -1);
									
									_bnet_network_send_raw(__bnet_client_id, __bnet_socket, _bnet_write_buffer, 2);
								
									_bnet_logger_client(__bnet_client_id, "lefted a room");
								
									break;
								}
							}else if(__bnet_room_goto == "-1") {
								_bnet_sendError(__bnet_socket, _bnet_write_buffer, "201");
											
								_bnet_logger_client(__bnet_client_id, "FAILED TO LEAVE ROOM, ALREADY LEFT");
								
								break;
							}
								
							//Search to see if room exists.
							var __bnet_room = _bnet_server_room_map[? __bnet_room_goto];
								
							if(__bnet_room != undefined){
								//Notify all clients within my room that i joined.
								buffer_seek(_bnet_write_buffer, buffer_seek_start, 0);
	 															
					 			buffer_write(_bnet_write_buffer, buffer_s8, 2);
					 			buffer_write(_bnet_write_buffer, buffer_s8, 1);
	 															
					 			_bnet_client_serialize(_bnet_write_buffer,  __bnet_client);
										
								buffer_resize(_bnet_write_buffer, buffer_tell(_bnet_write_buffer));
	 															
					 			if(_bnet_network_send_broadcast_tcp(__bnet_room[? "client_list"], _bnet_write_buffer, undefined)){
									_bnet_logger_client(__bnet_client_id, "joined the room");
										
									buffer_seek(_bnet_write_buffer, buffer_seek_start, 2);
												
									_bnet_callback_push(bnet_callbacks.room_client_joined, _bnet_client_deserialize(_bnet_write_buffer));
								}
								
							}else{
								//else create it.
								__bnet_room									= ds_map_create();
								__bnet_room[? "id"]							= __bnet_room_goto;
								__bnet_room[? "host"]						= __bnet_client;
								__bnet_room[? "client_list"]				= ds_list_create();
								__bnet_room[? "client_map"]					= ds_map_create();
								__bnet_room[? "instance_list"]				= ds_list_create();
								__bnet_room[? "instance_map"]				= ds_map_create();
								__bnet_room[? "destroy"]					= buffer_read(__bnet_read_buffer, buffer_bool);
									
								//Add room to server room cache.
								_bnet_server_room_map[? __bnet_room_goto]	= __bnet_room;
									
								//Used for cleaning up on destroy.
								ds_list_add(_bnet_server_room_list, __bnet_room);			
									
								//Add room client list to list hashmap.
								_bnet_server_list_map[? __bnet_room_goto]	= __bnet_room[? "client_list"];
							}
								
							//Add myself to room.
							ds_list_add(__bnet_room[? "client_list"], __bnet_client);
								
							ds_map_add(__bnet_room[? "client_map"], __bnet_client_id, __bnet_client);
								
							//Update client room;
							__bnet_client[? "room"] = __bnet_room;
								
							buffer_seek(_bnet_write_buffer, buffer_seek_start, 0);
	 														
					 		buffer_write(_bnet_write_buffer, buffer_s8,		2);
					 		buffer_write(_bnet_write_buffer, buffer_s8,		0);
					 		buffer_write(_bnet_write_buffer, buffer_string, __bnet_room_goto);
							buffer_write(_bnet_write_buffer, buffer_string, ds_map_find_value(__bnet_room[? "host"], "id"));
								
							_bnet_client_list_serialize(__bnet_room[? "client_list"], _bnet_write_buffer);
									
							_bnet_instance_list_serialize(__bnet_room[? "instance_list"], _bnet_write_buffer);
								
							_bnet_network_send_raw(__bnet_client_id, __bnet_socket, _bnet_write_buffer, buffer_tell(_bnet_write_buffer));
								
							_bnet_logger_client(__bnet_client_id, "swapped room");
						break;
					#endregion
					#region UPDATE
						case 3://ROOM UPDATE
				 			var
							__bnet_goto = buffer_read(__bnet_read_buffer, buffer_string),
		 															
				 			//Verify that a room exists.
				 			__bnet_room	= _bnet_server_room_map[? __bnet_goto];	
		 															
				 			if(__bnet_room != undefined) {
								var
								__bnet_cid 	= buffer_read(__bnet_read_buffer, buffer_string),
				 				__bnet_des 	= buffer_read(__bnet_read_buffer, buffer_s8),
								__bnet_host	= __bnet_room[? "host"];
		 																
				 				if(__bnet_cid != "") {
				 					//Check to see if client exists.
				 					var c = ds_map_find_value(__bnet_room[? "client_map"], __bnet_cid);
		 																	
				 					//If client exists.
				 					if(c != undefined) {
				 						__bnet_room[? "host"]	= c;
									
										__bnet_host				= c;
		 																		
				 						_bnet_logger_client(__bnet_client_id, "passed lead");
				 					}else {
				 						_bnet_sendError(__bnet_socket, _bnet_write_buffer, "202");
		 																		
				 						_bnet_logger_client(__bnet_client_id, "failed to pass lead invalid client id");
				 					}
				 				}
		 																
				 				if(__bnet_des != -1) {
				 					var __bnet_destroy = (__bnet_des < 1? false: true);
		 																	
				 					if(__bnet_room[? "destroy"] != __bnet_destroy) {
				 						__bnet_room[? "destroy"] = __bnet_destroy;
		 																		
				 						//Update destroy within buffer.
				 						__bnet_des = (__bnet_destroy? __bnet_des = 1: 0);
									
										_bnet_logger_client(__bnet_client_id, "UPDATED A ROOM DESTROY PARAMETER");
		 																		
				 						//Check to see if room empty, and set to destroy. if so destroy it.
				 						if(__bnet_destroy && ds_list_empty(__bnet_room[? "client_list"])) {
				 							_bnet_room_cleanup(__bnet_room);
		 																			
				 							_bnet_logger("ROOM AUTO DESTROYED DUE TO BEING EMPTY");
				 						}
				 					}
				 				}
		 																
				 				buffer_seek(_bnet_write_buffer, buffer_seek_start, 0);
		 																
				 				buffer_write(_bnet_write_buffer, buffer_s8,		2);
				 				buffer_write(_bnet_write_buffer, buffer_s8,		3);
							
								_bnet_client_serialize(_bnet_write_buffer, __bnet_host);
							
				 				buffer_write(_bnet_write_buffer, buffer_string, __bnet_goto);
							
				 				buffer_write(_bnet_write_buffer, buffer_bool,	(__bnet_des == 1? 1: 0));
							
								buffer_resize(_bnet_write_buffer, buffer_tell(_bnet_write_buffer));
		 																
				 				//Send update to all clients
				 				if(_bnet_network_send_broadcast_tcp(__bnet_room[? "client_list"], _bnet_write_buffer, undefined)){
								
									_bnet_logger_client(__bnet_client_id, "UPDATED MY ROOM");
								
									buffer_seek(_bnet_write_buffer, buffer_seek_start, 2);
								
									var __bnet_map			= _bnet_client_deserialize(_bnet_write_buffer)
									__bnet_map[? "room_id"]	= buffer_read(_bnet_write_buffer, buffer_string);
									__bnet_map[? "destroy"]	= buffer_read(_bnet_write_buffer, buffer_bool);
									
									_bnet_callback_push(bnet_callbacks.room_updated, __bnet_map);
								
								} else _bnet_logger_client(__bnet_client_id, "UPDATED ROOM");
				 			}else {
				 				_bnet_sendError(__bnet_socket, _bnet_write_buffer, "201");
		 																
				 				_bnet_logger_client(__bnet_client_id, "FAILED TO UPDATE A ROOM INVALID ID");
				 			}
				 		break;
					#endregion
					}
				break;
			#endregion
			#region INSTANCE
				case 3:
					var 
					__bnet_client_room	= __bnet_client[? "room"],
				
					__bnet_header		= buffer_read(__bnet_read_buffer, buffer_s8),
				
					__bnet_room_id		= buffer_read(__bnet_read_buffer, buffer_string),
				
					__bnet_room			= _bnet_server_room_map[? __bnet_room_id];
				
					switch(__bnet_header){
					#region CREATE
						case 0:
							if(__bnet_room != undefined){
							
								var __bnet_self = buffer_read(__bnet_read_buffer, buffer_bool);
							
								//If client requests to cache the instance.
								if(buffer_read(__bnet_read_buffer, buffer_bool)){
									//Store it within hashmap.
									var __bnet_instance = _bnet_instance_deserialize(__bnet_read_buffer);
											
									if(ds_map_find_value(__bnet_room[? "instance_map"], __bnet_instance[? "id"]) == undefined){
												
										ds_map_add(__bnet_room[? "instance_map"], __bnet_instance[? "id"], __bnet_instance);
												
										ds_list_add(__bnet_room[? "instance_list"], __bnet_instance);
											
									}else{
										_bnet_sendError(__bnet_socket, _bnet_write_buffer, "300");
		 																		
				 						_bnet_logger_client(__bnet_client_id, "FAILED TO CREATE AN INSTANCE. INSTANCE ALREADY EXISTS");
									
										break;
									}
								}
										
								if(_bnet_network_send_broadcast_tcp(__bnet_room[? "client_list"], __bnet_read_buffer, (__bnet_self? undefined: __bnet_client))){
									buffer_seek(__bnet_read_buffer, buffer_seek_start, 5 + string_length(__bnet_room_id));
										
									_bnet_logger("INSTANCE CREATED");
									
									_bnet_callback_push(bnet_callbacks.instance_created, _bnet_instance_deserialize(__bnet_read_buffer));
								}else _bnet_logger_client(__bnet_client_id, "created an instance");
							}else{
			 					_bnet_sendError(__bnet_socket, _bnet_write_buffer, "301");
	 																	
			 					_bnet_logger_client(__bnet_client_id, "FAILED TO CREATE AN INSTANCE. NOT WITHIN A ROOM, OR ROOM DOESNT EXISTS");
			 				}
						break;
					#endregion
					#region DESTROY
						case 1:
							if(__bnet_room != undefined){
								var
								__bnet_inst_id	= buffer_read(__bnet_read_buffer, buffer_string),
							
								__bnet_instance	= ds_map_find_value(__bnet_room[? "instance_map"], __bnet_inst_id);
							
								if(__bnet_instance != undefined){
									ds_map_delete(__bnet_room[? "instance_map"], __bnet_inst_id);
											
									ds_list_delete(__bnet_room[? "instance_list"], ds_list_find_index(__bnet_room[? "instance_list"], __bnet_instance));
											
									ds_map_destroy(__bnet_instance);
											
									_bnet_logger_client(__bnet_client_id, "destroyed an instance");
								}else{
									_bnet_sendError(__bnet_socket, _bnet_write_buffer, "302");
											
									_bnet_logger_client(__bnet_client_id, "failed to destroy an instance. invalid id");
								}
										
								if(_bnet_network_send_broadcast_tcp(__bnet_room[? "client_list"], __bnet_read_buffer, undefined)){
									var __bnet_map		= ds_map_create();
									__bnet_map[? "id"]	= __bnet_inst_id;
									
									_bnet_callback_push(bnet_callbacks.instance_destroyed, __bnet_map);
								}
							}else{
								_bnet_sendError(__bnet_socket, _bnet_write_buffer, "303");
	 																	
			 					_bnet_logger_client(__bnet_client_id, "FAILED TO DESTROY AN INSTANCE. NOT WITHIN A ROOM");
							}
						break;
					#endregion
					#region UPDATE
						case 2: case 3:
							if(__bnet_room != undefined){
								if(__bnet_header == 2 || __bnet_room[? "host"] == __bnet_client){
									var
									__bnet_offset		= buffer_tell(__bnet_read_buffer),
									__bnet_instance		= ds_map_find_value(__bnet_room[? "instance_map"], buffer_read(__bnet_read_buffer, buffer_string));
										
									if(__bnet_instance != undefined){
										//Can perform collision checks here.
										__bnet_instance[? "object_index"]	= buffer_read(__bnet_read_buffer, buffer_string);
										__bnet_instance[? "sprite_index"]	= buffer_read(__bnet_read_buffer, buffer_string);
					 					__bnet_instance[? "x"]				= buffer_read(__bnet_read_buffer, buffer_s32);
					 					__bnet_instance[? "y"]				= buffer_read(__bnet_read_buffer, buffer_s32);
										//__bnet_instance[? "depth"]			= buffer_read(__bnet_read_buffer, buffer_s32);
											
										_bnet_logger_client(__bnet_client_id, "updated an instance");
									}else{
										_bnet_sendError(__bnet_socket, _bnet_write_buffer, "304");
											
										_bnet_logger_client(__bnet_client_id, "failed to update an instance. invalid id");
									}
										
									var __bnet_me = false;
											
									if(__bnet_is_tcp) __bnet_me = _bnet_network_send_broadcast_tcp(__bnet_room[? "client_list"], __bnet_read_buffer, undefined);
									else __bnet_me = _bnet_network_send_broadcast_udp(__bnet_client_id, __bnet_room[? "client_list"], __bnet_read_buffer, undefined);
											
									if(__bnet_me){
										buffer_seek(__bnet_read_buffer, buffer_seek_start, __bnet_offset);
													
										var __bnet_map					= ds_map_create();
										__bnet_map[? "id"]				= buffer_read(__bnet_read_buffer, buffer_string);
										__bnet_map[? "object_index"]	= asset_get_index(buffer_read(__bnet_read_buffer, buffer_string));
										__bnet_map[? "sprite_index"]	= asset_get_index(buffer_read(__bnet_read_buffer, buffer_string));
										__bnet_map[? "x"]				= buffer_read(__bnet_read_buffer, buffer_s32);
										__bnet_map[? "y"]				= buffer_read(__bnet_read_buffer, buffer_s32);
									
										var
										__bnet_offset					= buffer_tell(__bnet_read_buffer),
										__bnet_size						= buffer_get_size(__bnet_read_buffer) - __bnet_offset,
										__bnet_buffer					= buffer_create(__bnet_size, buffer_grow, 1);
									
										__bnet_map[? "buffer"]			= __bnet_buffer;
									
										buffer_copy(__bnet_read_buffer, __bnet_offset, __bnet_size, __bnet_buffer, 0);
												
										buffer_seek(__bnet_buffer, buffer_seek_start, 0);
	
										_bnet_callback_push(bnet_callbacks.instance_updated, __bnet_map);
												
										_bnet_logger("Instance updated");
									}
								}else{
									_bnet_sendError(__bnet_socket, _bnet_write_buffer, "305");
	 																	
				 					_bnet_logger_client(__bnet_client_id, "FAILED TO UPDATE AN NPC NOT ROOM LEAD");
								}
							}else{
								_bnet_sendError(__bnet_socket, _bnet_write_buffer, "306");
	 																	
			 					_bnet_logger_client(__bnet_client_id, "FAILED TO UPDATE AN INSTANCE. NOT WITHIN A ROOM, or invalid room id");
							}
						break;
					#endregion
					
					#region LOCKSTEP
						case 4:
							if(__bnet_client_room != undefined){
								if(_bnet_network_send_broadcast_tcp(__bnet_client_room[? "client_list"], __bnet_read_buffer, __bnet_client)){
									var
									__bnet_frame		= buffer_read(__bnet_read_buffer, buffer_u32),
									__bnet_frame_data	= _bnet_lockstep_map[? __bnet_frame],
									__bnet_remaining	= _bnet_buffer_remaining(__bnet_read_buffer),
									__bnet_buffer;
						
									if(__bnet_remaining > 0){
										//Check to see if the frame has already been cached
										if(__bnet_frame_data == undefined){
											//If not cache it.
											__bnet_buffer = buffer_create(__bnet_remaining, buffer_grow, 1);
							
											buffer_copy(__bnet_read_buffer, buffer_tell(__bnet_read_buffer), __bnet_remaining, __bnet_buffer, 0);
							
											_bnet_lockstep_map[? __bnet_frame] = [1, __bnet_buffer];
										}else{
											//Update cached frame.
											__bnet_buffer = __bnet_frame_data[1];
							
											buffer_copy(__bnet_read_buffer, buffer_tell(__bnet_read_buffer), __bnet_remaining, __bnet_buffer, buffer_get_size(__bnet_buffer));
							
											__bnet_frame_data[@ 0]++;
										}
									}
								}
							}
						break;
					#endregion
					}
				break;
			#endregion
			#region NAMESPACE
				case 5:
					switch(buffer_read(__bnet_read_buffer, buffer_s8)){
					#region CREATE
						case 0:
							var
							__bnet_name	= buffer_read(__bnet_read_buffer, buffer_string),
							n			= _bnet_server_namespace_map[? __bnet_name];
										
							if(n == undefined){
								n					= ds_map_create();
								n[? "name"]			= __bnet_name;
								n[? "client_list"]	= ds_list_create();
								n[? "client_map"]	= ds_map_create();
											
								_bnet_server_namespace_map[? __bnet_name]	= n;
										
								_bnet_server_list_map[? __bnet_name]		= n[? "client_list"];
											
								_bnet_network_send_raw(__bnet_client_id, __bnet_socket, __bnet_read_buffer, buffer_get_size(__bnet_read_buffer));
		 																
				 				_bnet_logger_client(__bnet_client_id, "CREATED A NAMESPACE");
							}else{
								_bnet_sendError(__bnet_socket, _bnet_write_buffer, "500");
		 																
				 				_bnet_logger_client(__bnet_client_id, "FAILED TO CREATE NAMESPACE. ALREADY EXISTS");
							}
						break;
					#endregion
					#region ADD
						case 1:
							var n = _bnet_server_namespace_map[? buffer_read(__bnet_read_buffer, buffer_string)];
	 																
			 				if(n != undefined) {
			 					var c = _bnet_server_client_map[? buffer_read(__bnet_read_buffer, buffer_string)];
	 																	
			 					if(c != undefined) {
			 						if(ds_map_find_value(n[? "client_map"], c[? "id"]) == undefined) {
				 						ds_list_add(n[? "client_list"], c);
				 						ds_map_add(n[? "client_map"], c[? "id"], c);
		 																		
					 					buffer_seek(_bnet_write_buffer, buffer_seek_start, 0);
																		        
										buffer_write(_bnet_write_buffer, buffer_s8,		5);
										buffer_write(_bnet_write_buffer, buffer_s8,		1);
										buffer_write(_bnet_write_buffer, buffer_string, n[? "name"]);
				 								
										_bnet_client_list_serialize(n[? "client_list"], _bnet_write_buffer);
				 																
						 				buffer_resize(_bnet_write_buffer, buffer_tell(_bnet_write_buffer));
				 																
						 				if(_bnet_network_send_broadcast_tcp(n[? "client_list"], _bnet_write_buffer, undefined)){
											_bnet_logger("Namespace updated");
													
											buffer_seek(_bnet_write_buffer, buffer_seek_start, 2);
									
											var __bnet_map					= ds_map_create();
											__bnet_map[? "name"]			= buffer_read(_bnet_write_buffer, buffer_string);
											var __bnet_vec2					= _bnet_client_list_deserialize(_bnet_write_buffer);
									
											__bnet_map[? "client_map"]		= __bnet_vec2[0];
											__bnet_map[? "client_list"]		= __bnet_vec2[1];
									
											_bnet_callback_push(bnet_callbacks.namespace_updated, __bnet_map);
										}
				 																
						 				_bnet_logger_client(__bnet_client_id, "ADDED A CLIENT TO A NAMESPACE");
			 						}else {
			 							_bnet_sendError(__bnet_socket, _bnet_write_buffer, "501");
				 																
						 				_bnet_logger_client(__bnet_client_id, "FAILED TO ADD A CLIENT TO NAMESPACE. CLIENT CLIENT ALREADY WITHIN IT");
			 						}
			 					}else {
			 						_bnet_sendError(__bnet_socket, _bnet_write_buffer, "502");
			 																
					 				_bnet_logger_client(__bnet_client_id, "FAILED TO ADD A CLIENT TO NAMESPACE. CLIENT DOESNT EXISTS");
			 					}
			 				}else {
			 					_bnet_sendError(__bnet_socket, _bnet_write_buffer, "503");
		 																
				 				_bnet_logger_client(__bnet_client_id, "FAILED TO ADD A CLIENT TO NAMESPACE. NAMESPACE DOESNT EXISTS");
			 				}
						break;
					#endregion
					#region DELETE
						case 2:
			 				var n = _bnet_server_namespace_map[? buffer_read(__bnet_read_buffer, buffer_string)];
	 																
			 				if(n != undefined) {
			 					var c = ds_map_find_value(n[? "client_map"], buffer_read(__bnet_read_buffer, buffer_string));
	 																	
			 					if(c != undefined) {
				 					buffer_seek(_bnet_write_buffer, buffer_seek_start, 0);
																	        
									buffer_write(_bnet_write_buffer, buffer_s8,		5);
									buffer_write(_bnet_write_buffer, buffer_s8,		1);
									buffer_write(_bnet_write_buffer, buffer_string, n[? "name"]);
			 								
									_bnet_client_list_serialize(n[? "client_list"], _bnet_write_buffer);
			 																
					 				buffer_resize(_bnet_write_buffer, buffer_tell(_bnet_write_buffer));
			 																
					 				if(_bnet_network_send_broadcast_tcp(n[? "client_list"], _bnet_write_buffer, undefined)){
										_bnet_logger("Namespace updated");
													
										buffer_seek(_bnet_write_buffer, buffer_seek_start, 2);
									
										var __bnet_map					= ds_map_create();
										__bnet_map[? "name"]			= buffer_read(_bnet_write_buffer, buffer_string);
										var __bnet_vec2					= _bnet_client_list_deserialize(_bnet_write_buffer);
									
										__bnet_map[? "client_map"]		= __bnet_vec2[0];
										__bnet_map[? "client_list"]		= __bnet_vec2[1];
									
										_bnet_callback_push(bnet_callbacks.namespace_updated, __bnet_map);
									}
			 																
					 				ds_list_delete(n[? "client_list"], ds_list_find_index(n[? "client_list"], c));
		 						
									ds_map_delete(n[? "client_map"], c[? "id"]);
			 																
					 				_bnet_logger_client(__bnet_client_id, "DELETED A CLIENT FROM A NAMESPACE");
			 					}else {
			 						_bnet_sendError(__bnet_socket, _bnet_write_buffer, "504");
			 																
					 				_bnet_logger_client(__bnet_client_id, "FAILED TO DELETE A CLIENT FROM NAMESPACE. CLIENT DOESNT EXISTS");
			 					}
			 				}else {
			 					_bnet_sendError(__bnet_socket, _bnet_write_buffer, "505");
		 																
				 				_bnet_logger_client(__bnet_client_id, "FAILED TO DELETE A CLIENT FROM NAMESPACE. NAMESPACE DOESNT EXISTS");
			 				}
			 			break;
					#endregion
					#region DESTROY
			 			case 3:
			 				var 
							__bnet_id	= buffer_read(__bnet_read_buffer, buffer_string),
			 				n			= _bnet_server_namespace_map[? __bnet_id];
	 																
			 				if(n != undefined) {
			 					buffer_seek(_bnet_write_buffer, buffer_seek_start, 0);
																        
								buffer_write(_bnet_write_buffer, buffer_s8,		5);
								buffer_write(_bnet_write_buffer, buffer_s8,		2);
								buffer_write(_bnet_write_buffer, buffer_string, __bnet_id);
		 																
				 				buffer_resize(_bnet_write_buffer, buffer_tell(_bnet_write_buffer));
		 																
				 				if(_bnet_network_send_broadcast_tcp(n[? "client_list"], _bnet_write_buffer, undefined)){
									_bnet_logger("Namespace destroyed");
				
									var __bnet_map			= ds_map_create();
									__bnet_map[? "name"]	= __bnet_id;
									
									_bnet_callback_push(bnet_callbacks.namespace_destroyed, __bnet_map);
								}
		 																
				 				ds_map_delete(_bnet_server_namespace_map, __bnet_id);
										
								ds_map_delete(_bnet_server_list_map, __bnet_id);
										
				 				ds_list_destroy(n[? "client_list"]);
										
								ds_map_destroy(n[? "client_map"]);
										
								ds_map_destroy(n);
		 																
				 				_bnet_logger_client(__bnet_client_id, "DESTROYED A NAMESPACE");
			 				}else {
			 					_bnet_sendError(__bnet_socket, _bnet_write_buffer, "506");
		 																
				 				_bnet_logger_client(__bnet_client_id, "FAILED TO DESTROY NAMESPACE. NAMESPACE DOESNT EXISTS");
			 				}
			 			break;
					#endregion
					}
				break;
			#endregion
			}
		break;
	#endregion
	#region CLIENT
		case 1:
			_bnet_prev_time	= _bnet_system_time;
		
			switch(__bnet_header){
			#region CUSTOM BUFFER
				case -6: case -7:
					buffer_read(__bnet_read_buffer, buffer_string);
				
					_bnet_logger("received a packet");
			
					script_execute(asset_get_index("bnetOnMessage"), __bnet_read_buffer);
				break;
			#endregion
			#region VERSION CHECK
				case -5:
					_bnet_logger("acquired server version");
							
					var __bnet_map			= ds_map_create();
					__bnet_map[? "version"]	= buffer_read(__bnet_read_buffer, buffer_string);
							
					_bnet_callback_push(bnet_callbacks.version_checked, __bnet_map);
				break;
			#endregion
			#region CUSTOM EVENTS
				case -3: case -4:
					_bnet_logger("REQUESTED TO EXECUTE A CUSTOM EVENT");
							
					var 
					__bnet_list		= buffer_read(__bnet_read_buffer, buffer_string),
					__bnet_script	= buffer_read(__bnet_read_buffer, buffer_string),
					__bnet_data		= buffer_read(__bnet_read_buffer, buffer_string);
							
					script_execute(asset_get_index(__bnet_script), __bnet_data);
				break;
			#endregion
			#region ERROR
				case -2:
					var __bnet_map			= ds_map_create();
					__bnet_map[? "error"]	= buffer_read(__bnet_read_buffer, buffer_string);
							
					_bnet_logger(" BNET EVENT ERROR { "+string_upper(__bnet_map[? "error"])+ " } CHECK 'onError' NOTES FOR MORE INFO");
							
					_bnet_callback_push(bnet_callbacks.onError, __bnet_map);
				break;
			#endregion
			#region PING
				case -1:
					//show_debug_message(_bnet_time_stamp + " BNET DEBUGGER:: RECEIVED PING FROM SERVER");
					buffer_read(__bnet_read_buffer, buffer_u16);
				
					_bnet_ping				= (_bnet_system_time / 1000) - buffer_read(__bnet_read_buffer, buffer_u32);
					_bnet_info[? "ping"]	= _bnet_ping;
				break;
			#endregion
			#region CONNECTION HANDLING
				case 0:
					switch(buffer_read(__bnet_read_buffer, buffer_s8)){
					#region SERVER SHUTDOWN
						case -2:
							_bnet_logger("SERVER ABOUT TO SHUT DOWN");
									
							var 
							__bnet_alarm				= buffer_read(__bnet_read_buffer, buffer_u32),
							__bnet_event_map			= ds_map_create();
							__bnet_event_map[? "timer"] = __bnet_alarm;
							alarm[5]					= __bnet_alarm;
		
							_bnet_callback_push(bnet_callbacks.server_shutting_down, __bnet_event_map);
						break;
					#endregion
					#region CONNECTED
						case 0:
							_bnet_info[? "connected"]			= true;
							_bnet_client_list					= buffer_read(__bnet_read_buffer, buffer_string);
							_bnet_info[? "server"]				= _bnet_client_list;
									
							var 
							__bnet_client_vec2					= _bnet_client_list_deserialize(__bnet_read_buffer),
							__bnet_event_map					= ds_map_create();
									
							__bnet_event_map[? "client_map"]	= __bnet_client_vec2[0];
							__bnet_event_map[? "client_list"]	= __bnet_client_vec2[1];
										
							//Turn on ping.
							alarm[1]							= 1;
									
							_bnet_logger("CONNECTION SUCCESFULL");
										
							_bnet_callback_push(bnet_callbacks.connected, __bnet_event_map);
						break;
					#endregion
					#region DISCONNECTED
						case 1:
							_bnet_logger("DISCONNECTED FROM THE SERVER");
										
							instance_destroy();
										
							_bnet_callback_push(bnet_callbacks.disconnected);
						break;
					#endregion
					#region RECONNECTED
						case 2:
									
						break;
					#endregion
									
					#region CLIENT CONNECTED
						case 3:
							_bnet_logger_client(__bnet_client_id, "CONNECTED TO THE SERVER");
										
							_bnet_callback_push(bnet_callbacks.client_connected, _bnet_client_deserialize(__bnet_read_buffer));
						break;
					#endregion
					#region CLIENT DISCONNECTED
						case 4:
							_bnet_logger_client(__bnet_client_id, "DISCONNECTED FROM THE SERVER");
										
							_bnet_callback_push(bnet_callbacks.client_disconnected, _bnet_client_deserialize(__bnet_read_buffer));
						break;
					#endregion
					#region CLIENT RECONNECTED
						case 5:
							_bnet_logger_client(__bnet_client_id, "RECONNECTED TO THE SERVER");
										
						break;
					#endregion
					}
				break;
			#endregion
			#region CHAT
				case 1:
					switch(buffer_read(__bnet_read_buffer, buffer_s8)){
					#region TEXT
						case 0:
							_bnet_logger("CHAT UPDATED");
									
							var __bnet_map			= _bnet_client_deserialize(__bnet_read_buffer);
							__bnet_map[? "list"]	= buffer_read(__bnet_read_buffer, buffer_string);
							__bnet_map[? "message"] = buffer_read(__bnet_read_buffer, buffer_string);
									
							_bnet_callback_push(bnet_callbacks.chat_updated, __bnet_map);
						break;
					#endregion
					#region VOIP
						case 1:
							var
							__bnet_list			= buffer_read(__bnet_read_buffer, buffer_string),
							__bnet_samplerate	= buffer_read(__bnet_read_buffer, buffer_s16),
							__bnet_duration		= buffer_read(__bnet_read_buffer, buffer_u16),
							__bnet_size			= buffer_read(__bnet_read_buffer, buffer_u16),
							__bnet_event_map	= _bnet_client_deserialize(__bnet_read_buffer),
							__bnet_map			= _bnet_info[? "voip"],
							__bnet_buffer		= buffer_create(__bnet_size, buffer_grow, 1);
														
							buffer_copy(__bnet_read_buffer, buffer_tell(__bnet_read_buffer), __bnet_size, __bnet_buffer, 0);
														
							var __bnet_newAudio = audio_create_buffer_sound(__bnet_buffer, buffer_s16, __bnet_samplerate, 0, __bnet_size, audio_mono);
														
							ds_list_add(__bnet_map[? "list"],	__bnet_newAudio);
							ds_list_add(__bnet_map[? "list"],	__bnet_buffer);
									
							__bnet_event_map[? "list"]			= __bnet_list;
							__bnet_event_map[? "audio"]			= __bnet_newAudio;
							__bnet_event_map[? "buffer"]		= __bnet_buffer;
							__bnet_event_map[? "sample_rate"]	= __bnet_samplerate;
							__bnet_event_map[? "tcp"]			= __bnet_is_tcp;
							__bnet_event_map[? "size"]			= __bnet_size;
							__bnet_event_map[? "duration"]		= __bnet_duration;
									
							_bnet_callback_push(bnet_callbacks.voip_updated, __bnet_event_map);
									
							_bnet_logger(" BNET DEBUGGER:: VOIP UPDATED");
						break;
					#endregion
					}
				break;
			#endregion
			#region ROOM CALLBACKS
				case 2: 
					switch(buffer_read(__bnet_read_buffer, buffer_s8)){
					#region LEFT
						case -1:
							_bnet_logger("Lefted room");
						
							_bnet_room_id				= "";
						
							_bnet_room_host				= "";
						
							_bnet_info[? "room"]		= "";

							_bnet_info[? "room_host"]	= "";
									
							_bnet_callback_push(bnet_callbacks.room_lefted);
						break;
					#endregion
					#region SWITCHING TO ROOM
						case 0:
							var
							__bnet_goto								= buffer_read(__bnet_read_buffer, buffer_string),
							__bnet_host								= buffer_read(__bnet_read_buffer, buffer_string),
							__bnet_client_vec2						= _bnet_client_list_deserialize(__bnet_read_buffer),
							__bnet_inst_vec2						= _bnet_instance_list_deserialize(__bnet_read_buffer),
							__bnet_event_map						= ds_map_create();
										
							_bnet_room_id							= __bnet_goto;
							_bnet_info[? "room"]					= _bnet_room_id;
						
							_bnet_room_host							= __bnet_host;
							_bnet_info[? "room_host"]				= __bnet_host;
										
							__bnet_event_map[? "id"]				= __bnet_goto;
							__bnet_event_map[? "host"]				= __bnet_host;
						
							__bnet_event_map[? "client_map"]		= __bnet_client_vec2[0];
							__bnet_event_map[? "client_list"]		= __bnet_client_vec2[1];
									
							__bnet_event_map[? "instance_map"]		= __bnet_inst_vec2[0];
							__bnet_event_map[? "instance_list"]		= __bnet_inst_vec2[1];
										
							_bnet_logger("Swapped room");
										
							_bnet_callback_push(bnet_callbacks.room_joined, __bnet_event_map);
						break;
					#endregion
					#region SOMEONE JOINED
						case 1:
							_bnet_logger_client(__bnet_client_id, "joined the room");
									
							_bnet_callback_push(bnet_callbacks.room_client_joined, _bnet_client_deserialize(__bnet_read_buffer));
						break;
					#endregion
					#region SOMEONE LEFT
						case 2:
							_bnet_logger_client(__bnet_client_id, "lefted the room");
									
							var 
							__bnet_map					= _bnet_client_deserialize(__bnet_read_buffer),
							__bnet_host					= buffer_read(__bnet_read_buffer, buffer_string);
									
							__bnet_map[? "host"]		= __bnet_host;
									
							_bnet_room_host				= __bnet_host;
									
							_bnet_info[? "room_host"]	= __bnet_host;
									
							_bnet_callback_push(bnet_callbacks.room_client_lefted, __bnet_map);
						break;
					#endregion
								
					#region UPDATED
						case 3:
							var __bnet_map			= _bnet_client_deserialize(__bnet_read_buffer);
						
							__bnet_map[? "room_id"]	= buffer_read(__bnet_read_buffer, buffer_string);
							__bnet_map[? "destroy"]	= buffer_read(__bnet_read_buffer, buffer_bool);
									
							_bnet_callback_push(bnet_callbacks.room_updated, __bnet_map);
						
							_bnet_logger("ROOM UPDATED");
						break;
					#endregion
					}
				break;
			#endregion
			#region INSTANCE CALLBACKS
				case 3:
					var 
					__bnet_header = buffer_read(__bnet_read_buffer, buffer_s8),
				
					__bnet_room = buffer_read(__bnet_read_buffer, buffer_string);
				
					switch(__bnet_header){
					#region CREATE
						case 0:
							buffer_read(__bnet_read_buffer, buffer_bool);
							buffer_read(__bnet_read_buffer, buffer_bool);
										
							_bnet_logger("INSTANCE CREATED");
									
							_bnet_callback_push(bnet_callbacks.instance_created, _bnet_instance_deserialize(__bnet_read_buffer));
						break;
					#endregion
					#region DESTROY
						case 1:
							_bnet_logger("INSTANCE DESTROYED");
						
							var __bnet_map		= ds_map_create();
							__bnet_map[? "id"]	= buffer_read(__bnet_read_buffer, buffer_string);
									
							_bnet_callback_push(bnet_callbacks.instance_destroyed, __bnet_map);
						break;
					#endregion
					#region UPDATE
						case 2: case 3:
							var __bnet_map					= ds_map_create();
							__bnet_map[? "id"]				= buffer_read(__bnet_read_buffer, buffer_string);
							__bnet_map[? "object_index"]	= asset_get_index(buffer_read(__bnet_read_buffer, buffer_string));
							__bnet_map[? "sprite_index"]	= asset_get_index(buffer_read(__bnet_read_buffer, buffer_string));
							__bnet_map[? "x"]				= buffer_read(__bnet_read_buffer, buffer_s32);
							__bnet_map[? "y"]				= buffer_read(__bnet_read_buffer, buffer_s32);
									
							var
							__bnet_offset					= buffer_tell(__bnet_read_buffer),
							__bnet_size						= buffer_get_size(__bnet_read_buffer) - __bnet_offset,
							__bnet_buffer					= buffer_create(__bnet_size, buffer_grow, 1);
									
							__bnet_map[? "buffer"]			= __bnet_buffer;
									
							buffer_copy(__bnet_read_buffer, __bnet_offset, __bnet_size, __bnet_buffer, 0);
									
							_bnet_callback_push(bnet_callbacks.instance_updated, __bnet_map);
									
							_bnet_logger("Instance updated");
						break;
					#endregion
					
					#region LOCKSTEP
						case 4:
							var
							__bnet_frame		= buffer_read(__bnet_read_buffer, buffer_u32),
							__bnet_frame_data	= _bnet_lockstep_map[? __bnet_frame],
							__bnet_remaining	= _bnet_buffer_remaining(__bnet_read_buffer),
							__bnet_buffer;
						
							if(__bnet_remaining > 0){
								//Check to see if the frame has already been cached
								if(__bnet_frame_data == undefined){
									//If not cache it.
									__bnet_buffer = buffer_create(__bnet_remaining, buffer_grow, 1);
							
									buffer_copy(__bnet_read_buffer, buffer_tell(__bnet_read_buffer), __bnet_remaining, __bnet_buffer, 0);
							
									_bnet_lockstep_map[? __bnet_frame] = [1, __bnet_buffer];
								}else{
									//Update cached frame.
									__bnet_buffer = __bnet_frame_data[1];
							
									buffer_copy(__bnet_read_buffer, buffer_tell(__bnet_read_buffer), __bnet_remaining, __bnet_buffer, buffer_get_size(__bnet_buffer));
							
									__bnet_frame_data[@ 0]++;
								}
							}
						break;
					#endregion
					}
				break;
			#endregion
			#region FILE
				case 4:
					switch(buffer_read(__bnet_read_buffer, buffer_s8)){
						case 0:
							_bnet_logger("File created");
									
							_bnet_callback_push(bnet_callbacks.file_created);
						break;
						case 1:
							_bnet_logger("File loaded");
									
							_bnet_callback_push(bnet_callbacks.file_loaded, json_decode(buffer_read(__bnet_read_buffer, buffer_string)));
						break;
						case 2:
							_bnet_logger("File updated");
									
							_bnet_callback_push(bnet_callbacks.file_updated);
						break;
						case 3:
							_bnet_logger("File deleted");
									
							_bnet_callback_push(bnet_callbacks.file_destroyed);
						break;
					}
				break;
			#endregion
			#region NAMESPACE
				case 5:
					switch(buffer_read(__bnet_read_buffer, buffer_s8)){
						case 0:
							_bnet_logger("Namespace created");
									
							var __bnet_map			= ds_map_create();
							__bnet_map[? "name"]	= buffer_read(__bnet_read_buffer, buffer_string);
									
							_bnet_callback_push(bnet_callbacks.namespace_created, __bnet_map);
						break;
						case 1:
							_bnet_logger("Namespace updated");
									
							var __bnet_map					= ds_map_create()
							__bnet_map[? "name"]			= buffer_read(__bnet_read_buffer, buffer_string);
							var __bnet_vec2					= _bnet_client_list_deserialize(__bnet_read_buffer);
									
							__bnet_map[? "client_map"]		= __bnet_vec2[0];
							__bnet_map[? "client_list"]		= __bnet_vec2[1];
									
							_bnet_callback_push(bnet_callbacks.namespace_updated, __bnet_map);
						break;
						case 2:
							_bnet_logger("Namespace destroyed");
				
							var __bnet_map			= ds_map_create();
							__bnet_map[? "name"]	= buffer_read(__bnet_read_buffer, buffer_string);
									
							_bnet_callback_push(bnet_callbacks.namespace_destroyed, __bnet_map);
						break;
					}
				break;
			#endregion
			#region MONGODB
				case 6:
					switch(buffer_read(__bnet_read_buffer, buffer_s8)){
					#region DATABASE
						case 0:
							switch(buffer_read(__bnet_read_buffer, buffer_s8)){
								case 0://CREATE
									_bnet_logger("Database created");
											
									var __bnet_map			= ds_map_create();
									__bnet_map[? "name"]	= buffer_read(__bnet_read_buffer, buffer_string);
											
									_bnet_callback_push(bnet_callbacks.mongodb_database_created, __bnet_map);
								break;
								case 1://GET
									var
									__bnet_name					= buffer_read(__bnet_read_buffer, buffer_string),
									__bnet_loop					= buffer_read(__bnet_read_buffer, buffer_u16),
									__bnet_list					= ds_list_create(),
									__bnet_map					= ds_map_create();
								
									__bnet_map[? "name"]		= __bnet_name;
									__bnet_map[? "databases"]	= __bnet_list;
											
									repeat(__bnet_loop) ds_list_add(__bnet_list, json_decode(buffer_read(__bnet_read_buffer, buffer_string)));
									
									_bnet_logger("Database(s) loaded");
									
									_bnet_callback_push(bnet_callbacks.mongodb_databases_loaded, __bnet_map);
								break;
								case 2://DESTORY
									_bnet_logger("Database destroyed");
											
									var __bnet_map		 = ds_map_create();
									__bnet_map[? "name"] = buffer_read(__bnet_read_buffer, buffer_string);
									
									_bnet_callback_push(bnet_callbacks.mongodb_database_destroyed, __bnet_map);
								break;
							}
						break;
					#endregion
					#region COLLECTION
						case 1:
							switch(buffer_read(__bnet_read_buffer, buffer_s8)){
								case 0://CREATE
									_bnet_logger("Collection created");
									
									var __bnet_map					= ds_map_create();
									__bnet_map[? "database_name"]	= buffer_read(__bnet_read_buffer, buffer_string);
									__bnet_map[? "collection_name"]	= buffer_read(__bnet_read_buffer, buffer_string);
											
									_bnet_callback_push(bnet_callbacks.mongodb_collection_created, __bnet_map);
								break;
								case 1://GET
									var 
									__bnet_database_name			= buffer_read(__bnet_read_buffer, buffer_string),
									__bnet_collection_name			= buffer_read(__bnet_read_buffer, buffer_string),
									__bnet_loop						= buffer_read(__bnet_read_buffer, buffer_u16),
									__bnet_list						= ds_list_create(),
									__bnet_map						= ds_map_create();
								
									__bnet_map[? "database_name"]	= __bnet_database_name;
									__bnet_map[? "collection_name"] = __bnet_collection_name;
									__bnet_map[? "collections"]		= __bnet_list;
											
									repeat(__bnet_loop) ds_list_add(__bnet_list, json_decode(buffer_read(__bnet_read_buffer, buffer_string)));
									
									_bnet_logger("Collection(s) loaded");
									
									_bnet_callback_push(bnet_callbacks.mongodb_collections_loaded, __bnet_map);
								break;
								case 2://DESTROYED
									_bnet_logger("Collection destroyed");
									
									var __bnet_map						= ds_map_create();
									__bnet_map[? "database_name"]		= buffer_read(__bnet_read_buffer, buffer_string);
									__bnet_map[? "collection_name"]	= buffer_read(__bnet_read_buffer, buffer_string);
											
									_bnet_callback_push(bnet_callbacks.mongodb_collection_destroyed, __bnet_map);
								break;
							}
						break;
					#endregion
					#region DOCUMENTS
						case 2:
							switch(buffer_read(__bnet_read_buffer, buffer_s8)){
								case 0://CREATE
									_bnet_logger("Document created");
											
									var __bnet_map					= ds_map_create();
									__bnet_map[? "database_name"]	= buffer_read(__bnet_read_buffer, buffer_string);
									__bnet_map[? "collection_name"]	= buffer_read(__bnet_read_buffer, buffer_string);
									__bnet_map[? "document_key"]	= buffer_read(__bnet_read_buffer, buffer_string);
											
									_bnet_callback_push(bnet_callbacks.mongodb_document_created, __bnet_map);
								break;
								case 1://LOADED
									var
									__bnet_database_name			= buffer_read(__bnet_read_buffer, buffer_string),
									__bnet_collection_name			= buffer_read(__bnet_read_buffer, buffer_string),
									__bnet_document_name			= buffer_read(__bnet_read_buffer, buffer_string),
									__bnet_loop						= buffer_read(__bnet_read_buffer, buffer_u16),
									__bnet_map						= ds_map_create(),
									__bnet_list						= ds_list_create();
								
									__bnet_map[? "database_name"]	= __bnet_database_name;
									__bnet_map[? "collection_name"]	= __bnet_collection_name;
									__bnet_map[? "document_key"]	= __bnet_document_name;
									__bnet_map[? "documents"]		= __bnet_list;
											
									repeat(__bnet_loop) ds_list_add(__bnet_list, json_decode(buffer_read(__bnet_read_buffer, buffer_string)));
									
									_bnet_logger("Document(s) loaded");
											
									_bnet_callback_push(bnet_callbacks.mongodb_documents_loaded, __bnet_map);
								break;
								//UPDATED
								case 2: case 3: case 4: case 5:
									_bnet_logger("Document updated");
											
									var __bnet_map					= ds_map_create();
									__bnet_map[? "database_name"]	= buffer_read(__bnet_read_buffer, buffer_string);
									__bnet_map[? "collection_name"]	= buffer_read(__bnet_read_buffer, buffer_string);
									__bnet_map[? "document_key"]	= buffer_read(__bnet_read_buffer, buffer_string);
											
									_bnet_callback_push(bnet_callbacks.mongodb_document_updated, __bnet_map);
								break;
								case 6://DESTROYED
									_bnet_logger("Document destroyed");
											
									var __bnet_map					= ds_map_create();
									__bnet_map[? "database_name"]	= buffer_read(__bnet_read_buffer, buffer_string);
									__bnet_map[? "collection_name"]	= buffer_read(__bnet_read_buffer, buffer_string);
									__bnet_map[? "document_key"]	= buffer_read(__bnet_read_buffer, buffer_string);
											
									_bnet_callback_push(bnet_callbacks.mongodb_document_destroyed, __bnet_map);
								break;
							}
						break;
					#endregion
					}
				break;
			#endregion
			#region EMAIL
				case 7:
					_bnet_logger("Email sent");
									
					_bnet_callback_push(bnet_callbacks.email_sent);
				break;
			#endregion
			#region UDPHP
				case 8:
							
				break;
			#endregion
			}
		break;
	#endregion
	}
			
	buffer_delete(__bnet_read_buffer);


}
