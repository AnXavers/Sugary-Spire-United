/// @description _bnet_buffer_replace_string(buffer, offset, length, string)
function _bnet_buffer_replace_string() {

	/// @param buffer	Buffer to target.
	/// @param offset	Offset which to replace bytes.
	/// @param length	Length of bytes to replace.
	/// @param string	String to to add in its place.
	var
	_bnet_array		= argument[0],
	_bnet_offset	= argument[1],
	_bnet_length	= argument[2],
	_bnet_string	= argument[3],
	_bnet_size		= buffer_get_size(_bnet_array),
	_bnet_buffer	= buffer_create(_bnet_size - _bnet_length + string_length(_bnet_string), buffer_grow, 1);

	//Copy the first portion of buffer.
	buffer_copy(_bnet_array, 0, _bnet_offset, _bnet_buffer, 0);
	buffer_seek(_bnet_buffer,  buffer_seek_start, _bnet_offset);
	//Write in replacement string.
	buffer_write(_bnet_buffer, buffer_string, _bnet_string);
	//Copy in final portion of buffer.
	buffer_copy(_bnet_array, _bnet_offset + _bnet_length, _bnet_size - (_bnet_offset + _bnet_length), _bnet_buffer, buffer_tell(_bnet_buffer));

	buffer_delete(_bnet_array);

	return _bnet_buffer;


}
