/// @function bnet_instance_init_data(array, variable, variable_type, value)
function bnet_instance_init_data(argument0, argument1, argument2, argument3) {

	/*  @description					A simple alternative to creating an array ready for bnet,
										instance initiating.

										Variable types: "m" = type_map, "l" = type_list, "p" = type_priority, 
										"q" = type_queue, "g" = type_grid, "s" = type_stack, "a" = array, 
										"" = other pointer or do not sync variable.
	*/

	/// @param {array}	array			The array to use.		
	/// @param {string}	variable		Variable name, and or indexes, columns.
	/// @param {string} variable_type	Variable type.
	/// @param {var}	value			Value to assign to variable upon creation.

#region Example
	/*
		arr = [],
	
		map = ds_map_create();
	
		bnet_instance_init_data(arr, "x", "", x);
	
		bnet_instance_init_data(arr, "y", "", y);
	
		bnet_instance_init_data(arr, "map", "m", map);
	*/
#endregion

	var 
	__bnet_array	= argument0,
	__bnet_height	= (array_length_2d(__bnet_array, 0) > 0? array_height_2d(__bnet_array): 0);

	__bnet_array[@ __bnet_height, 2] = argument3;
	__bnet_array[@ __bnet_height, 0] = argument1;
	__bnet_array[@ __bnet_height, 1] = argument2;


}
