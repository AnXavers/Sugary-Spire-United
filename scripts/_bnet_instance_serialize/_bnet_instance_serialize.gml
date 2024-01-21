/// @function _bnet_instance_serialize(buffer, instance)
function _bnet_instance_serialize(argument0, argument1) {

	/*  @description					Serialize a instance (ds_map) for net transport.

	*/

	/// @param {buffer} buffer			Buffer to write to.
	/// @param {ds_map} instance		Instance to serialize.

	var
	__bnet_buffer	= argument0,
	__bnet_instance	= argument1;

	buffer_write(__bnet_buffer, buffer_s32, 	__bnet_instance[? "x"]);
	buffer_write(__bnet_buffer, buffer_s32, 	__bnet_instance[? "y"]);
	buffer_write(__bnet_buffer, buffer_s32,		__bnet_instance[? "depth"]);
	buffer_write(__bnet_buffer, buffer_string,	__bnet_instance[? "object_index"]);
	buffer_write(__bnet_buffer, buffer_string,	__bnet_instance[? "sprite_index"]);
	buffer_write(__bnet_buffer, buffer_string,	__bnet_instance[? "layer"]);
	buffer_write(__bnet_buffer, buffer_string,	__bnet_instance[? "id"]);
	buffer_write(__bnet_buffer, buffer_string,	__bnet_instance[? "owner_id"]);
		
	var
	__bnet_arr	= __bnet_instance[? "create_data"],
	__bnet_size	= array_height_2d(__bnet_arr);
		
	buffer_write(__bnet_buffer, buffer_u16,	__bnet_size);
		
	for(var i = 0; i < __bnet_size; i++) {
		buffer_write(__bnet_buffer, buffer_string, __bnet_arr[i, 0]);
		buffer_write(__bnet_buffer, buffer_string, __bnet_arr[i, 1]);
		buffer_write(__bnet_buffer, buffer_string, __bnet_arr[i, 2]);
	}


}
