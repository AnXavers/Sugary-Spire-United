/// @function bnet_server_connect(type, ip, tcp/web_port, udp_port, uuid, name)
function bnet_server_connect(argument0, argument1, argument2, argument3, argument4) {

	/// @description					Makes an attempt to connect to a server at targeted ip and port.

	/// @param {string} ip				Server ip to connect to.
	/// @param {real}	tcp/web_port	Server tcp or ws port to connect to.
	/// @param {real}	udp_port		Server udp port to connect to.
	/// @param {string} uuid			Unique id to provide the client.
	/// @param {string} name			Username to assign to client.

	/// @call-back						connected

	/// @error-codes					"000", "408", "10013"

#region Examples
	/*
		bnet_server_connect("127.0.0.1", 30001, 30002, string(get_timer()), "Client");
	*/
#endregion

#region Code
	//If BNet hasnt been initiatedd as yet.
	if(!instance_exists(BNET_NETWORKMANAGER)){
		//Initiate it.
		with(instance_create_depth(0, 0, 0, BNET_NETWORKMANAGER)){
			var __bnet_socket			= _bnet_is_ws? network_socket_ws: network_socket_tcp
		
			_bnet_type					= 1;
		
			//Set bnet connection type.
			_bnet_connection_type		= (_bnet_is_ws? "1": "0");
		
			_bnet_socket_type			= __bnet_socket;
		
			_bnet_ip					= argument0;
		
			_bnet_tcp_port				= argument1;
		
			_bnet_server_udp_port		= argument2;
		
			_bnet_id					= argument3;
		
			_bnet_name					= argument4;
		
			//Try create tcp socket.
			_bnet_tcp_socket			= network_create_socket(__bnet_socket);
		
			if(_bnet_tcp_socket < 0){
				instance_destroy();
					
				_bnet_logger("FAILED TO BIND TCP SOCKET, NO AVAILABLE PORT");
					
				_bnet_sendError(_bnet_tcp_socket, 0, "10013");
					
				exit;
			}
		
			_bnet_info[? "tcp_port"]		= _bnet_tcp_port;
			_bnet_info[? "server_udp_port"] = _bnet_server_udp_port;
			_bnet_info[? "id"]				= _bnet_id;
			_bnet_info[? "name"]			= _bnet_name;
			_bnet_info[? "type"]			= "client";
		
			//Try connect to server.
			network_set_config(network_config_connect_timeout, _bnet_attempt_connect_timeout);
			network_set_config(network_config_use_non_blocking_socket, 1);
		
			network_connect_raw_async(_bnet_tcp_socket, _bnet_ip, _bnet_tcp_port);
		
			_bnet_logger("Trying connect to server");
		}
	}else {
		with(instance_create_depth(0, 0, 0, BNET_NETWORKMANAGER)){
			if(_bnet_info[? "connected"]) _bnet_logger("Already connected to server");
			else _bnet_logger("Still trying to connect to server");
		}
	}
#endregion


}
