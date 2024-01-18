function _bnet_onDisconnect(argument0) {
	var 
	__bnet_client		= argument0,
	__bnet_client_room	= __bnet_client[? "room"],
	__bnet_id			= __bnet_client[? "id"];
						
	//Check to see if client is within a room.
	if(__bnet_client_room != undefined) {
		var __bnet_list = __bnet_client_room[? "client_list"];
	
		//Remove myself from room client list, and map.
		ds_list_delete(__bnet_list, ds_list_find_index(__bnet_list, __bnet_client));
			
		ds_map_delete(__bnet_client_room[? "client_map"], __bnet_id);
			
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
				for(var i = 0; i < __bnet_size; i++){
					var __bnet_client_ = __bnet_list[| 0];
				
					if(__bnet_client_[? "ping"] < __bnet_ping) __bnet_host = __bnet_client_;
				}
			
				__bnet_client_room[? "host"] = __bnet_host;
			}
						
			//Notify all clients within my room that i left.
			buffer_seek(_bnet_write_buffer, buffer_seek_start, 0);
						
			buffer_write(_bnet_write_buffer, buffer_s8, 2);
			buffer_write(_bnet_write_buffer, buffer_s8, 2);
						
			_bnet_client_serialize(_bnet_write_buffer, __bnet_client);
						
			buffer_write(_bnet_write_buffer, buffer_string, ds_map_find_value(__bnet_client_room[? "host"], "id"));
				
			buffer_resize(_bnet_write_buffer, buffer_tell(_bnet_write_buffer));
		
			if(_bnet_network_send_broadcast_tcp(__bnet_list, _bnet_write_buffer, undefined)){
				_bnet_logger_client(__bnet_client[? "id"], " lefted the room");
							
				buffer_seek(_bnet_write_buffer, buffer_seek_start, 2);
							
				var __bnet_copy				= _bnet_client_deserialize(_bnet_write_buffer);
				__bnet_copy[? "host"]		= buffer_read(_bnet_write_buffer, buffer_string);
							
				_bnet_room_host				= __bnet_copy[? "host"];
				_bnet_info[? "room_host"]	= _bnet_room_host;
												
				_bnet_callback_push(bnet_callbacks.room_client_lefted, __bnet_copy);
			}
		}
	}

	//Remove client from server client list, and map
	ds_map_delete(_bnet_server_client_map, __bnet_id);
				
	ds_list_delete(_bnet_server_client_list, ds_list_find_index(_bnet_server_client_list, __bnet_client));
		
	//Notify all clients on the server that i left.
	buffer_seek(_bnet_write_buffer, buffer_seek_start, 0);
						
	buffer_write(_bnet_write_buffer, buffer_s8, 0);
	buffer_write(_bnet_write_buffer, buffer_s8, 4);
						
	_bnet_client_serialize(_bnet_write_buffer, __bnet_client);
				
	buffer_resize(_bnet_write_buffer, buffer_tell(_bnet_write_buffer));
				
	_bnet_network_send_broadcast_tcp(_bnet_server_client_list, _bnet_write_buffer, undefined);
		
	_bnet_logger_client(__bnet_client[? "id"]," DISCONNECTED");
				
	buffer_seek(_bnet_write_buffer, buffer_seek_start, 2);
							
	_bnet_callback_push(bnet_callbacks.client_disconnected, _bnet_client_deserialize(_bnet_write_buffer));


}
