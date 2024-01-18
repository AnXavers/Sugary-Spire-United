/// @function bnet_buffer_delete(buffer)
function _bnet_buffer_delete(argument0) {

	/// @description Deletes an array of buffers.

	/// @param {array} buffer

	var 
	__bnet_buffer	= argument0,
	__bnet_size		= array_length_1d(__bnet_buffer)-1;

	for(var i = 0; i < __bnet_size; i++) buffer_delete(__bnet_buffer[i]);


}
