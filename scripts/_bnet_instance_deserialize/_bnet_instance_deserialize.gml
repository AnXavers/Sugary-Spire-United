/// @function _bnet_instance_deserialize(buffer)
function _bnet_instance_deserialize(argument0) {

	/// @description				Deserialize a packet into a bnet instance ds_map.

	/// @param {buffer} buffer		Buffer to read from.

	/// @return ds_map

	var 
	__bnet_buffer						= argument0,
	__bnet_instance						= ds_map_create();
	__bnet_instance[? "x"]				= buffer_read(__bnet_buffer, buffer_s32);
	__bnet_instance[? "y"]				= buffer_read(__bnet_buffer, buffer_s32);
	__bnet_instance[? "depth"]			= buffer_read(__bnet_buffer, buffer_s32);
	__bnet_instance[? "object_index"]	= buffer_read(__bnet_buffer, buffer_string);
	__bnet_instance[? "sprite_index"]	= buffer_read(__bnet_buffer, buffer_string);
	__bnet_instance[? "layer"]			= buffer_read(__bnet_buffer, buffer_string);
	__bnet_instance[? "id"]				= buffer_read(__bnet_buffer, buffer_string);
	__bnet_instance[? "owner_id"]		= buffer_read(__bnet_buffer, buffer_string);

	var
	__bnet_size							= buffer_read(__bnet_buffer, buffer_u16),
	__bnet_arr							= [];

	for(var i = 0; i < __bnet_size; i++){
		__bnet_arr[i, 0]				= buffer_read(__bnet_buffer, buffer_string);
		__bnet_arr[i, 1]				= buffer_read(__bnet_buffer, buffer_string);
		__bnet_arr[i, 2]				= buffer_read(__bnet_buffer, buffer_string);
	}

	__bnet_instance[? "create_data"]	= __bnet_arr;

	return __bnet_instance;


}
