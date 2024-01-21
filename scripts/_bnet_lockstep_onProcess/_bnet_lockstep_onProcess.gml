/// @param frame
function _bnet_lockstep_onProcess(argument0) {
	var 
	__bnet_frame_data	= _bnet_lockstep_map[? argument0],
	__bnet_buffer		= __bnet_frame_data[1];
		
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
		
	ds_map_delete(_bnet_lockstep_map, argument0);

	_bnet_lockstep_wait = false;


}
