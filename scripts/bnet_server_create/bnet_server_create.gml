/// @function bnet_server_create(type, tcp_port, udp_port, max_clients, uuid, name)
function bnet_server_create(argument0, argument1, argument2, argument3, argument4, argument5) {

	/// @description						Attempts to create a Gml server.

	/// @param {real}	type				Type of server to create: network_socket_tcp, network_socket_ws
	/// @param {real}	tcp_port/web_port	Tcp port to bind too.
	/// @param {real}	udp_port			Udp port to bind too.
	/// @param {real}	maxClients			The maximum number of clients allowed.
	/// @param {string} uuid				Unique id to assign to server client.
	/// @param {string} name				Username to assign to server client.

	/// @call-back							server_created

	/// @error-codes						"10013"

#region Example
	/*
		Create a Tcp Server using 30001 as tcp port 30002 as udp port, and max clients of 100.
			bnet_server_create(network_socket_tcp, 30001, 30002, 100, string(get_timer()), "Host");
	*/
#endregion

	if(!instance_exists(BNET_NETWORKMANAGER)){
		var 
		__bnet_socket				= argument0,
		__bnet_web					= (__bnet_socket == network_socket_ws);
	
		//Initiate bnet as a Lan Server.
		with(instance_create_depth(0, 0, 0, BNET_NETWORKMANAGER)){
			_bnet_type				= 0;
		
			_bnet_socket_type		= __bnet_socket;
		
			_bnet_tcp_port			= argument1;
		
			_bnet_udp_port			= argument2;
		
			_bnet_server_udp_port	= _bnet_udp_port;
		
			_bnet_id				= argument4;
		
			_bnet_name				= argument5;
		
			//Set bnet connection type.
			_bnet_connection_type	= (__bnet_web? "1": "0");
		
			_bnet_logger("Attempting to create a server");
		
			//Try create both tcp and udp socket.
			_bnet_tcp_socket		= network_create_server_raw(__bnet_socket, _bnet_tcp_port, argument3);
			_bnet_udp_socket		= (__bnet_web? _bnet_tcp_socket: network_create_socket_ext(network_socket_udp, _bnet_udp_port));
		
			//If either fails, destroy this instance.
			if(_bnet_udp_socket < 0 || _bnet_tcp_socket < 0){
				_bnet_logger("Server create failed");
			
				instance_destroy();
			
				_bnet_sendError(_bnet_tcp_socket, 0, "10013");
				exit;
			}
		
			//Set server info.
			_bnet_server_client_map						= ds_map_create();
			_bnet_server_client_list						= ds_list_create();
	
			_bnet_server_room_map						= ds_map_create();
			_bnet_server_room_list							= ds_list_create();
	
			_bnet_server_namespace_map					= ds_map_create();
			_bnet_server_namespace_list						= ds_list_create();

			//Store all list here.
			_bnet_server_list_map						= ds_map_create();
		
			//Add server client list to list hashmap.
			_bnet_server_list_map[? string(_bnet_server_client_list)] = _bnet_server_client_list;
		
			_bnet_client_list								= string(_bnet_server_client_list);
		
			_bnet_info[? "id"]								= _bnet_id;
			_bnet_info[? "name"]							= _bnet_name;
			_bnet_info[? "tcp_port"]						= _bnet_tcp_port;
			_bnet_info[? "server_udp_port"]					= _bnet_udp_port;
			_bnet_info[? "udp_port"]						= _bnet_udp_port;
			_bnet_info[? "type"]							= "server";
			_bnet_info[? "server"]							= _bnet_client_list;
		
			if(__bnet_web){
				_bnet_info[? "connected"]					= true;
				_bnet_ip									= "";
										
				_bnet_info[? "id"]							= _bnet_id;
				_bnet_info[? "ip" ]							= _bnet_ip;
			
				//Create server client map.
				_bnet_server_local_client_map				= ds_map_create();
				_bnet_server_local_client_map[? "id"]		= _bnet_id;
				_bnet_server_local_client_map[? "name"]		= _bnet_name;
				_bnet_server_local_client_map[? "ip"]		= _bnet_ip;
				_bnet_server_local_client_map[? "socket"]	= _bnet_tcp_socket;
				_bnet_server_local_client_map[? "tcp_port"]	= _bnet_udp_port;
				_bnet_server_local_client_map[? "udp_port"]	= _bnet_tcp_port;
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
						
				__bnet_event_map[? "client_map"]		= __bnet_client_vec2[0];
				__bnet_event_map[? "client_list"]		= __bnet_client_vec2[1];
		
				_bnet_callback_push(bnet_callbacks.server_created, __bnet_event_map);
			}else{
				//Send a get my ip packet.
				buffer_resize(_bnet_write_buffer, 2);
			
				buffer_seek(_bnet_write_buffer,  buffer_seek_start, 0);
				buffer_write(_bnet_write_buffer, buffer_s8, -2);
				buffer_write(_bnet_write_buffer, buffer_s8, 0);
		
				var 
				_bnet_array_buffer	= _bnet_buffer_encode(_bnet_tcp_socket, _bnet_write_buffer, _bnet_mtu, _bnet_connection_type),
				__bnet_size			= array_length_1d(_bnet_array_buffer);
			
				for(var i = 0; i < __bnet_size - 1; i++){
					network_send_broadcast(_bnet_tcp_socket, _bnet_udp_port, _bnet_array_buffer[i], buffer_get_size(_bnet_array_buffer[i]));
			
					buffer_delete(_bnet_array_buffer[i]);
				}
			}
		}
	}else _bnet_logger("Server already started");


}
