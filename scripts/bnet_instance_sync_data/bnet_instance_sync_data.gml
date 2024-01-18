/// @function bnet_instance_sync_data(array, variable, variable_type, buffer_type, tolerance)
function bnet_instance_sync_data(argument0, argument1, argument2, argument3, argument4) {

	/*  @description					A simple alternative to creating an array ready for bnet syncing.

										Variable types: "m" = type_map, "l" = type_list, "p" = type_priority, 
										"q" = type_queue, "g" = type_grid, "s" = type_stack, "a" = array, 
										"" = other pointer or do not sync variable.
	*/

	/// @param {array}	array			The array to use.		
	/// @param {string}	variable		Variable name, and or indexes, columns.
	/// @param {string} variable_type	Variable type.
	/// @param {string} buffer_type		Buffer type. See gml buffer_types. example buffer_s8.
	/// @param {real}	tolerance		Amount of time to pass before syncing this variable.

#region Example
	/*
		var arr = [];
	
		bnet_instance_sync_data(arr, "x", "", buffer_s32, -1);
	
		bnet_instance_sync_data(arr, "y", "", buffer_s32, -1);
	
		bnet_instance_sync_data(arr, "name", "", buffer_string, 10000);
	*/
#endregion

	var 
	__bnet_array	= argument0,
	__bnet_height	= (array_length_2d(__bnet_array, 0) > 0? array_height_2d(__bnet_array): 0);

	__bnet_array[@ __bnet_height, 4] = argument4
	__bnet_array[@ __bnet_height, 0] = argument1;
	__bnet_array[@ __bnet_height, 1] = argument2;
	__bnet_array[@ __bnet_height, 2] = argument3;
	__bnet_array[@ __bnet_height, 3] = argument4;


}
