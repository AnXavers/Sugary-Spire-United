/// @function bnet_room_update(room, *client_id, *destroy)
function bnet_room_update() {

	/// @description				Makes a request to update room settings.

	/// @param {string}	room		Gml room id.
	/// @param {string} *client_id	OPTIONAL Enter the client's id whom to pass lead too. Enter "" to leave as default.
	/// @param {real}	*destroy	OPTIONALSet whether to allow the room to be auto destroyed. Enter -1 to leave as default.

	/// @call-back					room_updated

	/// @error-codes				"202", "203"

#region Example
	/*
		bnet_room_update(string(BNET_DEMO_ROOM_GAME_2), "", true);
	*/
#endregion

	var 
	__bnet_room_goto	= argument[0],
	__bnet_client_id	= (argument_count > 1? argument[1]: ""),
	__bnet_destroy		= (argument_count > 2? argument[2]: -1);

	with(BNET_NETWORKMANAGER){
		if(_bnet_type == 0){
			//Verify that a room exists.
			var __bnet_room	= _bnet_server_room_map[? __bnet_room_goto];	
		 															
			if(__bnet_room != undefined) { 							
				//Check to see if client exists.
				var __bnet_client = ds_map_find_value(__bnet_room[? "client_map"], __bnet_client_id);
			
				if(__bnet_client_id != "") {										
					//If client exists.
					if(__bnet_client != undefined) {
					 	__bnet_room[? "host"] = __bnet_client;
		 																		
					 	__bnet_client_id = __bnet_client[? "id"];
		 																		
					 	_bnet_logger_client(__bnet_client_id, "passed lead");
					}else {
					 	_bnet_sendError(_bnet_tcp_socket, _bnet_write_buffer, "202");
		 																		
					 	_bnet_logger_client(__bnet_client_id, "failed to pass lead invalid client id");
					}
				}else __bnet_client = __bnet_room[? "host"];
		 																
				if(__bnet_destroy != -1) {
					var __bnet_destroy = (__bnet_destroy < 1? false: true);
		 																	
					if(__bnet_room[? "destroy"] != __bnet_destroy) {
					 	__bnet_room[? "destroy"] = __bnet_destroy;
		 																		
					 	//Update __bnet_destroy within buffer.
					 	__bnet_destroy = (__bnet_destroy? __bnet_destroy = 1: 0);
		 																		
					 	//Check to see if room empty if so __bnet_destroy it.
					 	if(ds_list_empty(__bnet_room[? "client_list"])) {
					 		_bnet_room_cleanup(__bnet_room);
		 																			
					 		_bnet_logger_client(__bnet_client_id, "UPDATED A ROOM, ROOM AUTO DESTROYED DUE TO BEING EMPTY");
					 	}
					}
				}

				buffer_seek(_bnet_write_buffer, buffer_seek_start, 0);
		 																
				buffer_write(_bnet_write_buffer, buffer_s8, 2);
				buffer_write(_bnet_write_buffer, buffer_s8, 3);
		
				_bnet_client_serialize(_bnet_write_buffer, __bnet_client);
		
				buffer_write(_bnet_write_buffer, buffer_string, __bnet_room_goto);
		
				buffer_write(_bnet_write_buffer, buffer_bool, (__bnet_destroy == 1? 1: 0));
		 																
				//Send update to all clients
				if(_bnet_network_send_broadcast_tcp(__bnet_room[? "client_list"], _bnet_write_buffer, undefined)){
					buffer_seek(_bnet_write_buffer, buffer_seek_start, 2);
			
					var __bnet_map			= _bnet_client_deserialize(_bnet_write_buffer);
			
					__bnet_map[? "room_id"]	= buffer_read(_bnet_write_buffer, buffer_string);
					__bnet_map[? "destroy"]	= buffer_read(_bnet_write_buffer, buffer_bool);
									
					_bnet_logger("ROOM UPDATED");
									
					_bnet_callback_push(bnet_callbacks.room_updated, __bnet_map);
				}
			}else {
				_bnet_sendError(_bnet_tcp_socket, _bnet_write_buffer, "201");
		 																
				_bnet_logger_client(__bnet_client_id, "FAILED TO UPDATE A ROOM INVALID ID");
			}
		}else{
			buffer_seek(_bnet_write_buffer,		buffer_seek_start, 0);
	
			buffer_write(_bnet_write_buffer,	buffer_s8,		2);
			buffer_write(_bnet_write_buffer,	buffer_s8,		3);
			buffer_write(_bnet_write_buffer,	buffer_string,	__bnet_room_goto);
			buffer_write(_bnet_write_buffer,	buffer_string,	__bnet_client_id);
			buffer_write(_bnet_write_buffer,	buffer_s8,		__bnet_destroy);
	
			_bnet_network_send_raw(_bnet_id, _bnet_tcp_socket, _bnet_write_buffer, buffer_tell(_bnet_write_buffer));
		
			_bnet_logger("ROOM UPDATE REQUEST SENT");
		}
	}


}
