/// @function bnet_instance_deserialize(instance_ds_map)
function bnet_instance_deserialize(argument0) {

	/// @description						Convert a bnet ds_map into a gml instance.

	/// @param {ds_map} instance_ds_map		Instance ds_map.

	/// @return {real}	instance_id

#region Example
	/*
		case bnet_callbacks.instance_created:
			var 
			id_	 = bnet_callback_load[? "id"],
			inst = global.instance_map[? id_];
			
			if(inst == undefined || !instance_exists(inst)){
				inst = bnet_instance_deserialize(bnet_callback_load);
				
				if(id_ != "") global.instance_map[? id_] = inst;
			}
		break;
	*/
#endregion

	var __bnet_instance = argument0;

	with(instance_create_depth(__bnet_instance[? "x"], __bnet_instance[? "y"], __bnet_instance[? "depth"], asset_get_index(__bnet_instance[? "object_index"]))){
	
		if(__bnet_instance[? "sprite_index"] != "") sprite_index = asset_get_index(__bnet_instance[? "sprite_index"]);
	
		var 
		__bnet_create_data	= __bnet_instance[? "create_data"],
		__bnet_size			= (array_length_2d(__bnet_create_data, 0) > 0? array_height_2d(__bnet_create_data): 0);
	
		for(var i = 0; i < __bnet_size; i++){
			switch(__bnet_create_data[i, 1]){
				case "a":
					var 
					__bnet_string	= __bnet_create_data[i, 0],
					__bnet_comma	= string_pos("," , __bnet_string),
					__bnet_var_name	= string_copy(__bnet_string, 1, __bnet_comma - 1),
					__bnet_string_  = string_copy(__bnet_string, __bnet_comma + 1, string_length(__bnet_string)),
					__bnet_comma_   = string_pos("," , __bnet_string_),
					__bnet_index	= real(string_copy(__bnet_string_, 1, max(1, __bnet_comma_ - 1))),
					__bnet_column	= (__bnet_comma_ != 0? real(string_copy(__bnet_string_, __bnet_comma_ + 1, string_length(__bnet_string_))): -1);
													
					if(__bnet_comma != 0){
						var __bnet_var = variable_instance_get(id, __bnet_var_name);
																
						if(__bnet_column == -1) __bnet_var[@ __bnet_index] = __bnet_create_data[i, 2];
						else __bnet_var[@ __bnet_index, __bnet_column]     = __bnet_create_data[i, 2];
													
					}else show_error("Instance variable initiate failed, invalid array pointer. Missing comma 1", true);
				break;
	
				case "m": ds_map_read(variable_instance_get(id, __bnet_create_data[i, 0]),		__bnet_create_data[i, 2]);	break;
				case "l": ds_list_read(variable_instance_get(id, __bnet_create_data[i, 0]),		__bnet_create_data[i, 2]);	break;
				case "p": ds_priority_read(variable_instance_get(id, __bnet_create_data[i, 0]), __bnet_create_data[i, 2]);	break;
				case "q": ds_queue_read(variable_instance_get(id, __bnet_create_data[i, 0]),	__bnet_create_data[i, 2]);	break;
				case "g": ds_grid_read(variable_instance_get(id, __bnet_create_data[i, 0]),		__bnet_create_data[i, 2]);	break;
				case "s": ds_stack_read(variable_instance_get(id, __bnet_create_data[i, 0]),	__bnet_create_data[i, 2]);	break;
				default:  variable_instance_set(id, __bnet_create_data[i, 0],					__bnet_create_data[i, 2]);	break;
			}
		}
	
		if(!variable_instance_exists(id, "bnet_info")) bnet_info = ds_map_create();
	
		layer					= layer_get_id(__bnet_instance[? "layer"]);
		bnet_info[? "id"]		= __bnet_instance[? "id"];
		bnet_info[? "owner_id"]	= __bnet_instance[? "owner_id"];
	
		return id;
	}


}
