/// @description ESTABLISH UDP CONNECTION
buffer_resize(_bnet_write_buffer, 1);

buffer_seek(_bnet_write_buffer, buffer_seek_start, 0);
buffer_write(_bnet_write_buffer, buffer_s8, -2);

var b = _bnet_buffer_encode(_bnet_info[? "id"], _bnet_write_buffer, _bnet_mtu, _bnet_connection_type);

for(var i = 0; i < array_length_1d(b)-1; i++){
	network_send_udp_raw(_bnet_udp_socket, _bnet_ip, _bnet_udp_port, b[i], buffer_get_size(b[i]));
	
	buffer_delete(b[i]);
}

_bnet_logger("UDP AUTHENTICATION SENT");

alarm[0] = _bnet_ping_rate;