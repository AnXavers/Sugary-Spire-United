/// @function _bnet_buffer_remove_bytes(buffer, offset, length)
function _bnet_buffer_remove_bytes(argument0, argument1, argument2) {

	/// @param buffer	Buffer to target.
	/// @param offset	Offset.
	/// @param length	Length of bytes to remove.

	var
	_bnet_array		= argument0,
	_bnet_offset	= argument1,
	_bnet_length	= argument2,
	_bnet_size		= buffer_get_size(_bnet_array),
	_bnet_buffer	= buffer_create(_bnet_size - _bnet_length, buffer_grow, 1);

	//Copy the first portion of buffer.
	buffer_copy(_bnet_array, 0, _bnet_offset, _bnet_buffer, 0);

	//Copy in final portion of buffer.
	buffer_copy(_bnet_array, _bnet_offset + _bnet_length, _bnet_size - (_bnet_offset + _bnet_length), _bnet_buffer, _bnet_offset);

	buffer_delete(_bnet_array);

	return _bnet_buffer;


}
