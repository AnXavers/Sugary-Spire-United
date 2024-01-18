/// @function _bnet_client_deserialize(buffer)
function _bnet_client_deserialize(argument0) {

	/*  @description				Deserialize a packet into a client ds_map.

	*/

	/// @param {buffer} buffer		Buffer to read from.

	/// @return ds_map
	var 
	__bnet_buffer			= argument0,
	__bnet_map				= ds_map_create();

	__bnet_map[? "id"]		= buffer_read(__bnet_buffer, buffer_string);
	__bnet_map[? "name"]	= buffer_read(__bnet_buffer, buffer_string);
	__bnet_map[? "ip"]		= buffer_read(__bnet_buffer, buffer_string);
	__bnet_map[? "tcp_port"]= buffer_read(__bnet_buffer, buffer_u16);
	__bnet_map[? "udp_port"]= buffer_read(__bnet_buffer, buffer_u16);
	__bnet_map[? "ping"]	= buffer_read(__bnet_buffer, buffer_u8);
	__bnet_map[? "room"]	= buffer_read(__bnet_buffer, buffer_string);

	return __bnet_map;


}
