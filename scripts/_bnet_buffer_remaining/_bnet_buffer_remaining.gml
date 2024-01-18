/// @param buffer_id
function _bnet_buffer_remaining(argument0) {
	return buffer_get_size(argument0) - buffer_tell(argument0);


}
