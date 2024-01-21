/// @function _bnet_buffer_encode(sender_id, buffer, size, type)
function _bnet_buffer_encode(argument0, argument1, argument2, argument3) {
	/*
		description						This doesnt effect provided buffer in any way. 
									
										The last index or array_length-1 is NOT a buffer but instead
										the buffer string id. 
									
										A (56 + client id) byte header is applied.
	
										Use _bnet_buffer_delete() to properaly delete this array of buffers.
	*/

	/// @param {string} sender_id		The id of the sender.
	/// @param {buffer}	buffer			The buffer you wish to encode.
	/// @param {real} size				The size you wish to cap the buffer too.
	/// @param {string} type			Which connection type to use as a header encoder? "0" = Tcp, "1" = Websocket.

	/// @returns array					An array of buffers with max capped of provided size. With the last index being a sha1 rep of the buffer.

#region Example
	/*
		var encoded_buffer = _bnet_buffer_encode(buffer, _bnet_mtu);
		for(var i = 0; i < array_length_1d(encoded_buffer)-1; i++){
			network_send_raw(socket, encoded_buffer[i], buffer_get_size(encoded_buffer[i]));
		}
		_bnet_buffer_delete(encoded_buffer);
	*/
#endregion

	var
	__bnet_client_id	= argument0,
	__bnet_src_buffer	= argument1, 
	__bnet_mtu_size		= argument2,
	__bnet_buffer_size	= buffer_get_size(__bnet_src_buffer), 
	__bnet_id_length	= string_length(__bnet_client_id),
	__bnet_target_size	= 56 + __bnet_id_length, 
	__bnet_tag_id		= buffer_sha1(__bnet_src_buffer, 0, __bnet_buffer_size),
	__bnet_seek_pos		= 0, 
	__bnet_index		= 0, 
	__bnet_con_type		= argument3,
	__bnet_debug		= false,// TOOGLE TO SHOW DEBUG LOG.
	__bnet_buffer,
	__bnet_segment_size,
	__bnet_target_buffer;

	//Loop through buffer whiles there's data to be read.
	while(__bnet_seek_pos < __bnet_buffer_size){
		//Get the target size of how much data I can read from the source buffer compared to how much data can be written to target buffer.
		__bnet_segment_size = min(__bnet_buffer_size - __bnet_seek_pos, max(1, __bnet_mtu_size - __bnet_target_size));
	
		//Create a fixed size buffer with headers.
		__bnet_buffer = buffer_create(__bnet_target_size + __bnet_segment_size, buffer_fixed, 1);
		buffer_seek(__bnet_buffer,  buffer_seek_start, 0);
	
		buffer_write(__bnet_buffer, buffer_text,	"BNet"+__bnet_con_type);//5
		buffer_write(__bnet_buffer, buffer_u8,		__bnet_id_length);//6
		buffer_write(__bnet_buffer, buffer_string,	__bnet_client_id);//7
		buffer_write(__bnet_buffer, buffer_string,	__bnet_tag_id);//41: 48
		buffer_write(__bnet_buffer, buffer_u16,		__bnet_index);//50
		buffer_write(__bnet_buffer, buffer_u16,		__bnet_segment_size);//52
		buffer_write(__bnet_buffer, buffer_u32,		__bnet_buffer_size);//56
	
		//Copy partial data from source into targeted buffer.
		buffer_copy(__bnet_src_buffer, __bnet_seek_pos, __bnet_segment_size, __bnet_buffer, __bnet_target_size);
	
		//Place __bnet_buffer into cache.
		__bnet_target_buffer[__bnet_index] = __bnet_buffer;
	
		//Update seek position.
		__bnet_seek_pos += __bnet_segment_size;
		__bnet_index++;
	}

	//Set buffer tag.
	__bnet_target_buffer[__bnet_index] = __bnet_tag_id;

	if(__bnet_debug) show_debug_message(string(__bnet_client_id)+"  "+string(__bnet_tag_id)+"  "+string(__bnet_seek_pos)+"  "+string(__bnet_buffer_size)+"  "+string(array_length_1d(__bnet_target_buffer)-1));

	return __bnet_target_buffer;


}
