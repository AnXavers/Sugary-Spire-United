shutdown_timer--;

//Loop until processed all data
while(bnet_data_start){
	switch(bnet_callback){
		case bnet_callbacks.onError:
			show_debug_message("error: "+bnet_callback_load[? "error"]);
		break;
		
		#region Connection
		case bnet_callbacks.server_created:
		case bnet_callbacks.connected:
			room_host = "";
			var 
			clients	= bnet_callback_load[? "client_map"];
			
			//Update list of clients.
			for (var k = ds_map_find_first(clients); !is_undefined(k); k = ds_map_find_next(clients, k)) {
		
				//Copy map over.
				var copy = ds_map_create();
				ds_map_copy(copy, clients[? k]);
				
				global.client_map[? ds_map_find_value(clients[? k], "id")] = copy;
			}
			room_goto(BNET_DEMO_ROOM_SUB_MENU);
		break;
		
		case bnet_callbacks.client_connected:
			var client = bnet_callback_load;
			
			var copy = ds_map_create();
			ds_map_copy(copy, client);
			
			global.client_map[? client[? "id"]] = copy;
		break;
		
		case bnet_callbacks.client_disconnected:
			var id_ = bnet_callback_load[? "id"];
		
			ds_map_delete(global.client_map, id_);
			
			var inst = global.instance_map[? id_];
			
			if(inst != undefined){
				instance_destroy(inst);
				
				ds_map_delete(global.instance_map, id_);
			}
		break;
		
		case bnet_callbacks.server_shutting_down:
			shutdown_timer = bnet_callback_load[? "timer"];
		break;
		case bnet_callbacks.server_shut_downed: bnet_disconnect();
		case bnet_callbacks.server_destroyed:
		case bnet_callbacks.disconnected:
		
			for (var k = ds_map_find_first(global.room_client_map); !is_undefined(k); k = ds_map_find_next(global.room_client_map, k)) {
				ds_map_destroy(global.room_client_map[? k]);
			}
			
			for (var i = 0; i < ds_list_size(global.messages); i++) {
				ds_map_destroy(global.messages[| i]);
			}
			
			ds_list_clear(global.messages);
			
			ds_map_clear(global.room_client_map);
			
			for (var k = ds_map_find_first(global.client_map); !is_undefined(k); k = ds_map_find_next(global.client_map, k)) {
				ds_map_destroy(global.client_map[? k]);
			}
			
			ds_map_clear(global.client_map);
			
			for (var k = ds_map_find_first(global.instance_map); !is_undefined(k); k = ds_map_find_next(global.instance_map, k)) {
				var inst = global.instance_map[? k];
				
				if(instance_exists(inst)) instance_destroy(inst);
			}
			
			ds_map_clear(global.instance_map);
			
			room_goto(BNET_DEMO_ROOM_MAIN);
		break;
		
		#endregion
	
		#region Room
		case bnet_callbacks.room_lefted:
			//Clear previous clients hashMap.
			for (var k = ds_map_find_first(global.room_client_map); !is_undefined(k); k = ds_map_find_next(global.room_client_map, k)) {
				ds_map_destroy(global.room_client_map[? k]);
			}
			
			ds_map_clear(global.room_client_map);
			
			with(BNET_DEMO_OBJECT_PLAYER) instance_destroy();	
			
			ds_map_clear(global.instance_map);
			
			room_goto(BNET_DEMO_ROOM_SUB_MENU);
		break;
		
		#region Room joined
		case bnet_callbacks.room_joined:
			room_host	= bnet_callback_load[? "host"];
			
			var
			//Room id.
			room_id		= bnet_callback_load[? "id"],
			
			room_goto_	= (room_id != ""? real(room_id): BNET_DEMO_ROOM_MAIN),
			
			//Returns a ds_list with the ids of the instance as the key.
			instances	= bnet_callback_load[? "instance_map"],
			
			clients		= bnet_callback_load[? "client_map"];
			
			//Clear previous room clients hashMap.
			for (var k = ds_map_find_first(global.room_client_map); !is_undefined(k); k = ds_map_find_next(global.room_client_map, k)) {
				ds_map_destroy(global.room_client_map[? k]);
			}
			
			ds_map_clear(global.room_client_map);
			
			//Update list of clients.
			for (var k = ds_map_find_first(clients); !is_undefined(k); k = ds_map_find_next(clients, k)) {
		
				//Copy map over.
				var copy = ds_map_create();
				ds_map_copy(copy, clients[? k]);
		
				global.room_client_map[? ds_map_find_value(clients[? k], "id")] = copy;
			}
			
			//Go to room.
			room_goto(room_goto_);
			
			var 
			my_id	 = bnet("id"),
			my_inst	 = global.instance_map[? my_id];
			
			ds_map_clear(global.instance_map);
			
			//Destroy previous instances.
			with(BNET_DEMO_OBJECT_PLAYER) if(bnet_info[? "id"] != my_id) instance_destroy(); else global.instance_map[? my_id] = id;
			
			//If my instance already exists. Request to create it on clients.
			if(my_inst != undefined && instance_exists(my_inst)) bnet_instance_create(my_inst.x, my_inst.y, "Instances", BNET_DEMO_OBJECT_PLAYER, my_id, [], true, bnet("room"), false);
			else global.instance_map[? my_id] = bnet_instance_create_layer(room_width/2, room_height/2, "Instances", BNET_DEMO_OBJECT_PLAYER, my_id, [], true);
	
			//Create all other instances
			for (var k = ds_map_find_first(instances); !is_undefined(k); k = ds_map_find_next(instances, k)) {
				var inst = instances[? k];
				
				//If the instance belong to me skip it.
				if(inst[? "id"] != my_id) global.instance_map[? inst[? "id"]] = bnet_instance_deserialize(inst);
			}
		break;
		#endregion
	
		case bnet_callbacks.room_client_joined:
			var 
			client	= bnet_callback_load,
			copy	= ds_map_create();
			ds_map_copy(copy, client);
			
			global.room_client_map[? client[? "id"]] = copy;
		break;
		case bnet_callbacks.room_client_lefted:
			ds_map_delete(global.room_client_map, bnet_callback_load[? "id"]);
		break;
		#endregion
		
		#region Instance
		case bnet_callbacks.instance_created:
			var 
			id_	 = bnet_callback_load[? "id"],
			inst = global.instance_map[? id_];
			
			if(inst == undefined || !instance_exists(inst)){
				inst = bnet_instance_deserialize(bnet_callback_load);
				
				if(id_ != "") global.instance_map[? id_] = inst;
			}
		break;
		case bnet_callbacks.instance_destroyed:
			var 
			id_	 = bnet_callback_load[? "id"],
			inst = global.instance_map[? id_];
		
			if(id_ != bnet("id")){
				if(inst != undefined && instance_exists(inst)) instance_destroy(inst);
			
				ds_map_delete(global.instance_map, id_);
			}
		break;
		case bnet_callbacks.instance_updated:
			var 
			id_		= bnet_callback_load[? "id"],
			inst	= global.instance_map[? id_];
			
			if(inst != undefined && instance_exists(inst)){
				//Get co ord.
				ds_list_add(inst.goto, [bnet_callback_load[? "x"], bnet_callback_load[? "y"]]);
			}
		break;
		#endregion
		
		#region Chat
		case bnet_callbacks.chat_updated:
			var copy = ds_map_create();
			
			ds_map_copy(copy, bnet_callback_load);
			
			ds_list_add(global.messages, copy);
			
			if(ds_list_size(global.messages) > 10){
				ds_map_destroy(global.messages[| 0]);
				
				ds_list_delete(global.messages, 0);
			}
		break;
		
		case bnet_callbacks.voip_updated:
			var inst = global.instance_map[? bnet_callback_load[? "id"]];
			
			if(inst != undefined) inst.voip = 60;
			
			audio_play_sound(bnet_callback_load[? "audio"], 0, 0);
		break;
		#endregion
	}
	
	//Clean up call-back data
	bnet_data_end
}

if(bnet("connected")){
	bnet_voip(mic, 1);
		
	if(keyboard_check_pressed(ord("G"))) bnet_chat_send_message(get_string("Send globally", ""), bnet("server"));
		
	if(keyboard_check_pressed(ord("R"))) bnet_chat_send_message(get_string("Send to room", ""), bnet("room"));
}