/// @function _bnet_client_serialize(buffer, client)
function _bnet_client_serialize(argument0, argument1) {

	/*  @description					Serialize a client(ds_map) for net transport

	*/

	/// @param {buffer} buffer			Buffer to write to.
	/// @param {ds_map} client			Client to serialize.

	var
	__bnet_buffer = argument0,
	__bnet_client = argument1;

	buffer_write(__bnet_buffer, buffer_string,	__bnet_client[? "id"]);
	buffer_write(__bnet_buffer, buffer_string,	__bnet_client[? "name"]);
	buffer_write(__bnet_buffer, buffer_string,	__bnet_client[? "ip"]);
	buffer_write(__bnet_buffer, buffer_u16,		__bnet_client[? "tcp_port"]);
	buffer_write(__bnet_buffer, buffer_u16,		__bnet_client[? "udp_port"]);
	buffer_write(__bnet_buffer, buffer_u8,		__bnet_client[? "ping"]);
	buffer_write(__bnet_buffer, buffer_string,	(__bnet_client[? "room"] == undefined? "": __bnet_client[? "room"]));

	return __bnet_buffer;


}
