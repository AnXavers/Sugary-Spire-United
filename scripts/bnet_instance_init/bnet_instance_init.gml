/// @function bnet_instance_init(*data)
function bnet_instance_init() {

	/*	@description			Initiate this object within bnet. Provide a 2d array with a height of 4.
									{string} variable name
									{string} variable type 
									{real}	 variable size associated with buffer_type
									{real}	 tick_rate at which to sync value
								
								Suggested to 'bnet_instance_sync_data()' to pass data.
								
								TYPES: "m" = type_map, "l" = type_list, "p" = type_priority, "q" = type_queue, "g" = type_grid, "s" = type_stack, "a" = array, 
								"" = other pointer or do not sync variable.
	
								Use "," within parameter variable as a seperator. example if type = "a". Use "," to point to desired index, and optionally column like so:
									
									bnet_instance_sync_data(arr, "save_slot,0", "a", buffer_s32, -1);
		
									bnet_instance_sync_data(arr, "save_slot,0,0", "a", buffer_s32, -1);
		
								BEWARE OF MEMORY LEAK DO NOT SYNC NESTED DATA STRUCTURES.
	*/

	/// @param {array} *data	OPTIONAL Variables to sync. Suggested to use bnet_sync_data(); DEFAULT: [].

#region Example
	/*
		var arr = [];
	
		bnet_instance_sync_data(arr, "x", "", buffer_s32, -1);
	
		bnet_instance_sync_data(arr, "y", "", buffer_s32, -1);
	
		bnet_instance_sync_data(arr, "name", "", buffer_string, 10000);
	
		bnet_instance_init(arr);
	*/
#endregion

	bnet_info						 = (!variable_instance_exists(id, "bnet_info")? ds_map_create(): bnet_info);

	if(ds_map_size(bnet_info) < 6){
		var 
		__bnet_array				 = (argument_count > 0? argument[0]: []),
		__bnet_height				 = array_height_2d(__bnet_array),
		__bnet_length				 = array_length_2d(__bnet_array, 0);

		if(__bnet_length > 0 && __bnet_length < 5) for(var i = 0; i < __bnet_height; i++) __bnet_array[@ i, 4] = __bnet_array[@ i, 3];

		bnet_info[? "id"]			 = "";
		bnet_info[? "owner_id"]		 = "";
	
		bnet_info[? "variable_list"] = __bnet_array;
		bnet_info[? "timer"]		 = 0;
		bnet_info[? "read_buffer"]	 = buffer_create(1, buffer_grow, 1);
		bnet_info[? "write_buffer"]	 = buffer_create(1, buffer_grow, 1);
		
		buffer_seek(bnet_info[? "read_buffer"], buffer_seek_start, 1);
		buffer_seek(bnet_info[? "write_buffer"], buffer_seek_start, 0);
	
		//Lockstep
		bnet_info[? "lockstep"]				= false;
		bnet_info[? "lockstep_input_array"]	= [];
	}


}
