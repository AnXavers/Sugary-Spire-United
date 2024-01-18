/// @description HANDLES CALL-BACK, AND DISCONNECTION TIMEOUT

if(!global._bnet_callback_cleanup_) _bnet_callback_cleanup();

global._bnet_callback_cleanup_ = false;

_bnet_system_time	= get_timer();
_bnet_time_passed	= (_bnet_system_time - _bnet_prev_time);

if(_bnet_type == 0){
	
}else{
	if(_bnet_time_passed / 1000000 > _bnet_connection_timeout){
		
		_bnet_logger("CONNECTION TIMED OUT");
		
		instance_destroy();
		
		_bnet_callback_push(bnet_callbacks.disconnected);
	}
}

#region LOCKSTEP
if(_bnet_lockstep_active){
	if(_bnet_lockstep_timeout <= 0){
		for (var k = ds_map_find_first(_bnet_lockstep_map); k != undefined; k = ds_map_find_next(_bnet_lockstep_map, k)) buffer_delete(array_get(_bnet_lockstep_map[? k], 1));
		
		ds_map_clear(_bnet_lockstep_map);
			
		_bnet_lockstep_wait		= true;
		
		_bnet_lockstep_active	= false;
		
		ds_list_clear(_bnet_lockstep_instance_list);
		
		_bnet_logger("Room lockstep timedout");
		
		_bnet_callback_push(bnet_callbacks.lockstep_timedout);
	}
	
	#region Send input
	if(!_bnet_lockstep_wait){
		var
		__bnet_size		= ds_list_size(_bnet_lockstep_instance_list),
		__bnet_target	= _bnet_lockstep_frame + _bnet_lockstep_input_delay,
		__bnet_instance;
		
		buffer_seek(_bnet_write_buffer, buffer_seek_start, 0);
		
		buffer_write(_bnet_write_buffer, buffer_s8, 3);
		
		buffer_write(_bnet_write_buffer, buffer_s8, 4);
		
		buffer_write(_bnet_write_buffer, buffer_string, _bnet_room_id);
	
		buffer_write(_bnet_write_buffer, buffer_u32, __bnet_target);
		
		for(var i = 0; i < __bnet_size; i++){
			__bnet_instance = _bnet_lockstep_instance_list[| i];
			
			if(!instance_exists(__bnet_instance)){
				ds_list_delete(_bnet_lockstep_instance_list, i);
				
				i--;
				
				__bnet_size--;
				
				continue;
			}
			
			//Lock the instance.
			__bnet_instance.bnet_info[? "lockstep"] = true;
				
			//Only send my instance data.
			if(__bnet_instance.bnet_info[? "owner_id"] != _bnet_id) continue;
			
			buffer_write(_bnet_write_buffer, buffer_u32, __bnet_instance.object_index);
			
			buffer_write(_bnet_write_buffer, buffer_string, __bnet_instance.bnet_info[? "id"]);
			
			var 
			__bnet_inputs = __bnet_instance.bnet_info[? "lockstep_input_array"],
			__bnet_len	  = array_length_1d(__bnet_inputs);
			
			buffer_write(_bnet_write_buffer, buffer_u8, __bnet_len);
			
			for(var o = 0; o < __bnet_len; o++) buffer_write(_bnet_write_buffer, buffer_bool, variable_instance_get(__bnet_instance, __bnet_inputs[o]));
		}
		
		var
		__bnet_size			= buffer_tell(_bnet_write_buffer),
		__bnet_offset		= 7 + string_length(_bnet_room_id),
		__bnet_frame_data	= _bnet_lockstep_map[? __bnet_target],
		__bnet_buffer;
	
		//Check to see if the frame has already been cached
		if(__bnet_frame_data == undefined){
			//If not cache it.
			__bnet_buffer	= buffer_create(__bnet_size - __bnet_offset, buffer_grow, 1);
							
			buffer_copy(_bnet_write_buffer, __bnet_offset, __bnet_size - __bnet_offset, __bnet_buffer, 0);
							
			_bnet_lockstep_map[? __bnet_target] = [1, __bnet_buffer];
		}else{
			//Update cached frame.
			__bnet_buffer = __bnet_frame_data[1];
							
			buffer_copy(_bnet_write_buffer, __bnet_offset, __bnet_size - __bnet_offset, __bnet_buffer, buffer_get_size(__bnet_buffer));
							
			__bnet_frame_data[@ 0]++;
		}
		
		if(_bnet_type == 1) _bnet_network_send_raw(_bnet_id, _bnet_tcp_socket, _bnet_write_buffer, __bnet_size);
		else{
			buffer_resize(_bnet_write_buffer, __bnet_size);
			
			_bnet_network_send_broadcast_tcp(_bnet_server_local_room_list, _bnet_write_buffer, undefined);
		}
		
		_bnet_lockstep_wait	= true;
	}
	#endregion

	#region Process	
	var __bnet_frame_data = _bnet_lockstep_map[? _bnet_lockstep_frame];
	
	if(__bnet_frame_data != undefined){
		
		//Tick if current frame received all data
		if(__bnet_frame_data[0] == _bnet_lockstep_sessions){
			var __bnet_buffer = __bnet_frame_data[1];
		
			while(_bnet_buffer_remaining(__bnet_buffer) > 0){
				var 
				__bnet_instance = buffer_read(__bnet_buffer, buffer_u32),
				__bnet_id		= buffer_read(__bnet_buffer, buffer_string),
				__bnet_found	= false;
				
				with(__bnet_instance){
					
					if(bnet_info[? "id"] == __bnet_id){
						__bnet_found			= true;
					
						bnet_info[? "lockstep"] = false;
					
						var 
						__bnet_size = buffer_read(__bnet_buffer, buffer_u8),
						__bnet_array = bnet_info[? "lockstep_input_array"];
					
						for(var o = 0; o < __bnet_size; o++) variable_instance_set(id, __bnet_array[o], buffer_read(__bnet_buffer, buffer_bool));
					
						break;
					}
				}
			
				if(!__bnet_found){
					var __bnet_size = buffer_read(__bnet_buffer, buffer_u8);
				
					buffer_seek(__bnet_buffer, buffer_seek_start, buffer_tell(__bnet_buffer) + __bnet_size);
				}
			}
		
			buffer_delete(__bnet_buffer);
		
			ds_map_delete(_bnet_lockstep_map, _bnet_lockstep_frame);
			
			_bnet_lockstep_timeout = room_speed * _bnet_lockstep_input_delay;
			
			_bnet_lockstep_frame++;
			
			_bnet_lockstep_wait = false;
		}else{
			//Waiting for other's inputs.
			_bnet_lockstep_timeout--;
		}
	}else{
		_bnet_lockstep_timeout = room_speed * _bnet_lockstep_input_delay;
		
		_bnet_lockstep_frame++;
		
		_bnet_lockstep_wait = false;
	}
	#endregion
}
#endregion