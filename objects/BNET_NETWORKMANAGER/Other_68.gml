/// @description DO NOT EDIT
/*
	If using the networking event in another object, use
	_bnet_buffer_encoded() to ensure that the buffer isnt
	bnet encoded.
*/
switch(async_load[? "type"]){
	#region CONNECTION CHECK
	case network_type_connect:
	case network_type_non_blocking_connect:
		if(_bnet_type == 0){
			
		}else if (!async_load[? "succeeded"]){
			//If failed to connect to server destroy this instance.
			instance_destroy();
				
			_bnet_logger("Connection failed");
				
			_bnet_sendError(_bnet_tcp_socket, 0, "408");
		}else{
			//Try create udp socket.
			_bnet_udp_port = 6510;
			
			if(_bnet_is_ws) _bnet_udp_socket = _bnet_tcp_socket;
			else{
				_bnet_udp_socket = network_create_socket_ext(network_socket_udp, _bnet_udp_port);
				
				while (_bnet_udp_socket < 0 && _bnet_udp_port < 65535){
					_bnet_udp_port++
					_bnet_udp_socket = network_create_socket_ext(network_socket_udp, _bnet_udp_port);
				}
			}				
			
			if(_bnet_udp_socket < 0){
				instance_destroy();
					
				_bnet_logger("FAILED TO BIND UDP SOCKET, NO AVAILABLE PORT");
					
				_bnet_sendError(_bnet_tcp_socket, 0, "10013");
					
				exit;
			}
			
			_bnet_info[? "udp_port"] = _bnet_udp_port;
		
			//Send registry data
			buffer_seek(_bnet_write_buffer, buffer_seek_start, 0);
		 	
			buffer_write(_bnet_write_buffer, buffer_s8,		-128);
		 	buffer_write(_bnet_write_buffer, buffer_string, _bnet_id);
		 	buffer_write(_bnet_write_buffer, buffer_string,	_bnet_name);
			buffer_write(_bnet_write_buffer, buffer_u16,	_bnet_udp_port);
		 	
			_bnet_network_send_raw(_bnet_id, _bnet_tcp_socket, _bnet_write_buffer, buffer_tell(_bnet_write_buffer));
		}
	break;
	#endregion
	#region DISCONNECTED
	case network_type_disconnect:
		var 
		__bnet_client,
		__bnet_size		= ds_list_size(_bnet_server_client_list),
		__bnet_socket	= async_load[? "socket"];
		
		for(var i = 0; i < __bnet_size; i++){
			__bnet_client = _bnet_server_client_list[| i];
			
			if(__bnet_client != undefined && __bnet_client[? "socket"] == __bnet_socket){
				
				_bnet_onDisconnect(__bnet_client);
				
				break;
			}
		}
	break;
	#endregion
	#region DATA
	case network_type_data:
		var
		__bnet_ws			= _bnet_is_ws,
		__bnet_src_buff		= async_load[? "buffer"],
		__bnet_header;
		
		#region Tcp/Websocket
		if(__bnet_ws || async_load[? "id"] != _bnet_udp_socket){
			var
			__bnet_type			 = "BNet"+(__bnet_ws? "1": "0"),
			__bnet_target_buffer = __bnet_src_buff;
			
			//if(_bnet_buffer_remaining(__bnet_target_buffer) < 7) show_debug_message("0packet less than 8");
			
			//if(_bnet_buffer_remaining(__bnet_target_buffer) < _bnet_missing_bytes) show_debug_message("not enough bytes in new packet");
			
			//Check to see if have previous data
			if(_bnet_missing_bytes > 0){
				__bnet_target_buffer = _bnet_stream_buffer;
		
				var __bnet_size = 8 - buffer_get_size(__bnet_target_buffer);
		
				//If missing any header
				if(__bnet_size > 0) {
					//Get remaining header bytes.
					buffer_resize(__bnet_target_buffer, buffer_get_size(__bnet_target_buffer) + __bnet_size);
					
					_bnet_buffer_copy(__bnet_src_buff, 0, __bnet_size, __bnet_target_buffer, buffer_tell(__bnet_target_buffer));
					
					_bnet_missing_bytes = (buffer_peek(__bnet_target_buffer, 5, buffer_u8) + 1) + buffer_peek(__bnet_target_buffer, 6, buffer_u16);
				}
				
				//Increase limit to contain missing bytes.
				buffer_resize(__bnet_target_buffer, buffer_get_size(__bnet_target_buffer) + _bnet_missing_bytes);
				
				_bnet_buffer_copy(__bnet_src_buff, buffer_tell(__bnet_src_buff), _bnet_missing_bytes, __bnet_target_buffer, buffer_tell(__bnet_target_buffer));
			
				_bnet_missing_bytes = 0;
			}
	
			while(_bnet_buffer_remaining(__bnet_target_buffer) > 7){
				__bnet_header		= "";
				
				var __bnet_offset	= buffer_tell(__bnet_target_buffer);
				
				repeat(5) __bnet_header += chr(buffer_read(__bnet_target_buffer, buffer_s8));
		
				if(__bnet_header == __bnet_type){
					var
					__bnet_id_length	= buffer_read(__bnet_target_buffer, buffer_u8) + 1,
					
					__bnet_buff_size	= buffer_read(__bnet_target_buffer, buffer_u16),
			
					__bnet_target_size  = __bnet_id_length + __bnet_buff_size;
			
					if(_bnet_buffer_remaining(__bnet_target_buffer) >= __bnet_target_size){
						
						var 
						__bnet_id		= buffer_read(__bnet_target_buffer, buffer_string),	
						
						__bnet_chunk	= buffer_create(__bnet_buff_size, buffer_grow, 1);
				
						_bnet_buffer_copy(__bnet_target_buffer, buffer_tell(__bnet_target_buffer), __bnet_buff_size, __bnet_chunk, 0);
						
						buffer_seek(__bnet_chunk, buffer_seek_start, 0);
						
						_bnet_onProcess(async_load, __bnet_chunk, __bnet_id, true);
						
						if(__bnet_target_buffer == _bnet_stream_buffer) __bnet_target_buffer = __bnet_src_buff;
						
						var __bnet_remaining = _bnet_buffer_remaining(__bnet_target_buffer);
						
						//Not enough bytes to complete next header.
						if(__bnet_remaining > 0 && __bnet_remaining < 8) {
							buffer_resize(_bnet_stream_buffer, __bnet_remaining);
							
							_bnet_buffer_copy(__bnet_target_buffer, buffer_tell(__bnet_target_buffer), __bnet_remaining, _bnet_stream_buffer, 0);
						
							_bnet_missing_bytes = 8 - __bnet_remaining;
						
							break;
						}
					
					}else{
						var __bnet_prev_remain = _bnet_buffer_remaining(__bnet_target_buffer);
						
						buffer_seek(__bnet_target_buffer, buffer_seek_start, __bnet_offset);
						
						var __bnet_remaining = _bnet_buffer_remaining(__bnet_target_buffer);
						
						buffer_resize(_bnet_stream_buffer, __bnet_remaining);
							
						_bnet_buffer_copy(__bnet_target_buffer, buffer_tell(__bnet_target_buffer), __bnet_remaining, _bnet_stream_buffer, 0);
						
						_bnet_missing_bytes = __bnet_target_size - __bnet_prev_remain;
				
						break;
					}
				}else{
					show_debug_message("header: "+__bnet_header);
				}
			}
		#endregion
		#region Udp
		}else{
			var 
			__bnet_debug = false,
			__bnet_check = false;
			
			//While there's data within buffer. Read from it.
			while(true){
				//Bnet Header.
				__bnet_header				= "";
	
				repeat(5) __bnet_header += chr(buffer_read(__bnet_src_buff, buffer_s8));
	
				if(__bnet_header == "BNet0"){
					//Check tag of received buffer.
					var
					__bnet_id_length		= buffer_read(__bnet_src_buff, buffer_u8),
					__bnet_client_id		= buffer_read(__bnet_src_buff, buffer_string),
					__bnet_tag				= buffer_read(__bnet_src_buff, buffer_string),
		
					//Read received buffer headers.
					__bnet_index			= buffer_read(__bnet_src_buff, buffer_u16),
					__bnet_segment_size		= buffer_read(__bnet_src_buff, buffer_u16),
					__bnet_total_size		= buffer_read(__bnet_src_buff, buffer_u32),
		
			 		//Get source buffer offset.
					__bnet_offset			= buffer_tell(__bnet_src_buff),
		
					//Get current read buffer.
					__bnet_current_buffer	= _bnet_buffer_udp_cache_map[? __bnet_tag];
		
					//If buffer doesnt exists cache it.
					if(__bnet_current_buffer == undefined){
						__bnet_current_buffer = ds_map_create();
			
						//Buffer tag.
						__bnet_current_buffer[? "tag"]	= __bnet_tag;
			
						//Buffer size.
						__bnet_current_buffer[? "size"]	= 0;
			
						//Buffer list
						__bnet_current_buffer[? "list"]	= ds_list_create();
			
						//Add buffer to cache list.
						_bnet_buffer_udp_cache_map[? __bnet_tag]	= __bnet_current_buffer;	
			
						ds_list_add(_bnet_buffer_udp_cache_list, __bnet_current_buffer);
					}
					
					//Search for duplicate ids if there's ids present. if found omit id.
					if(__bnet_current_buffer[? string(__bnet_index)] != undefined){
						__bnet_check = true;
				
						if(__bnet_debug) show_debug_message(__bnet_tag+": Index ["+string(__bnet_index)+"] omitted");
						break;
					}
		
					if(!__bnet_check){
						//Create a temporary buffer.
						var __bnet_temp_buffer = buffer_create(__bnet_segment_size, buffer_fixed, 1);
			
						buffer_copy(__bnet_src_buff, __bnet_offset, __bnet_segment_size, __bnet_temp_buffer, 0);
			
						//Increase stored buffer size for checking.
						__bnet_current_buffer[? "size"] += __bnet_segment_size;
			
						//Add temporary buffer to stored buffer array.
						__bnet_current_buffer[? string(__bnet_index)] = __bnet_temp_buffer;
			
						ds_list_add(__bnet_current_buffer[? "list"], __bnet_temp_buffer);
			
						if(__bnet_debug) show_debug_message(__bnet_tag+" : "+string(__bnet_index)+" :: "+string(__bnet_total_size)+" : "+string(__bnet_segment_size));
			
						//Check if all data is received.
						if(__bnet_current_buffer[? "size"] == __bnet_total_size){
				
							__bnet_temp_buffer	= buffer_create(__bnet_total_size, buffer_grow, 1);
				
							var 
							__bnet_map_size	= ds_map_size(__bnet_current_buffer),
							__bnet_copy_buffer,
							__bnet_copy_buffer_size;
				
							for(var i = 0, __bnet_buffer_offset = 0; i < __bnet_map_size - 3; i++){
								__bnet_copy_buffer			= __bnet_current_buffer[? string(i)];
					
								__bnet_copy_buffer_size	= buffer_get_size(__bnet_copy_buffer);
					
								buffer_copy(__bnet_copy_buffer, 0, __bnet_copy_buffer_size, __bnet_temp_buffer, __bnet_buffer_offset);
					
								__bnet_buffer_offset +=__bnet_copy_buffer_size;
					
								buffer_delete(__bnet_copy_buffer);	
							}
				
							//Check to see if tamper check is disabled if not, check to see if packet corrupted.
							if(true){//!tamper_check_ || buffer_sha1(temp_buffer, 0, total_size) == tag){
								//If all seems fine add packet to decoded list.
					
								buffer_seek(__bnet_temp_buffer, buffer_seek_start, 0);
								
								_bnet_onProcess(async_load, __bnet_temp_buffer, __bnet_client_id, false);
					
								if(__bnet_debug) show_debug_message("Buffer decoded successfully.\n["+string(ds_map_size(_bnet_buffer_udp_cache_map) - 1)+"] incomplete buffer(s)");
							}else{
								//Delete buffer due to tampering.
								if(__bnet_debug) show_debug_message("Buffer: "+string(ds_list_size(_bnet_buffer_udp_cache_list))+" deleted due to corruption.{ "+buffer_sha1(__bnet_temp_buffer, 0, __bnet_total_size)+" :: "+__bnet_tag+" }");
								buffer_delete(__bnet_temp_buffer);
							}
				
							//Remove current buffer array from cache list.
							ds_list_delete(_bnet_buffer_udp_cache_list, ds_list_find_index(_bnet_buffer_udp_cache_list, __bnet_current_buffer));
							
							ds_list_destroy(__bnet_current_buffer[? "list"]);
							
							ds_map_destroy(__bnet_current_buffer);
				
							ds_map_delete(_bnet_buffer_udp_cache_map, __bnet_tag);
						}
					}
		
					//Set new source buffer offset.
					buffer_seek(__bnet_src_buff, buffer_seek_start, __bnet_offset + __bnet_segment_size);
		
					//If potential new packet size greater than buffer stop looping.
					if(__bnet_offset + __bnet_segment_size + 56 + __bnet_id_length > buffer_get_size(__bnet_src_buff)) break;
				}else{
					//Buffer isnt bnet encoded. Reset buffer seek position.
					buffer_seek(__bnet_src_buff, buffer_seek_start, __bnet_offset);
		
					switch(__bnet_header){
						case "BNet1":
							show_debug_message("BNet buffer decode failed. Recieved packet from websocket");
						break;
						default:
							show_debug_message("BNet buffer decode failed. Buffer isnt bnet encoded: { "+string(__bnet_header)+" }");
						break;
					}
		
					break;
				}
			}
		}
		#endregion
	break;
	#endregion
}