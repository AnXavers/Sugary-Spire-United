function _bnet_buffer_copy(argument0, argument1, argument2, argument3, argument4) {

	/// @description		An alternative to gml buffer copy, copies a buffer updating both offset.

	/// @param src_buffer
	/// @param src_offset
	/// @param size
	/// @param dest_buffer
	/// @param dest_offset

	var 
	__bnet_src_buffer	= argument0,
	__bnet_src_offset	= argument1,
	__bnet_size			= argument2,
	__bnet_dest_buffer	= argument3,
	__bnet_dest_offset	= argument4;

	buffer_copy(__bnet_src_buffer, __bnet_src_offset, __bnet_size, __bnet_dest_buffer, __bnet_dest_offset);

	buffer_seek(__bnet_src_buffer, buffer_seek_start, buffer_tell(__bnet_src_buffer) + __bnet_size);
	buffer_seek(__bnet_dest_buffer, buffer_seek_start, buffer_tell(__bnet_dest_buffer) + __bnet_size);


}
