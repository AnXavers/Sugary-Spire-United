/// @function bnet_buffer_encoded(buffer);
function bnet_buffer_encoded(argument0) {

	/// @description	Returns whether the buffer is bnet encoded.

	/// @param buffer	Buffer to check if BNet encoded.

	var 
	__bnet_buffer	= argument0,
	__bnet_packet	= "";

	buffer_seek(__bnet_buffer, buffer_seek_start, 0);

	//Check to see if packet belongs to BNet.
	repeat(5) __bnet_packet += chr(buffer_read(__bnet_buffer, buffer_s8));

	for(var i = 0; i < 2; i++) if(__bnet_packet == "BNet"+string(i)) return true;

	//Return whether the packet is encoded.
	return false;


}
