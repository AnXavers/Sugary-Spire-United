///@description PING
//Send a ping 

buffer_resize(_bnet_write_buffer, 7);

buffer_seek(_bnet_write_buffer, buffer_seek_start, 0);

buffer_write(_bnet_write_buffer, buffer_s8,		-1);
buffer_write(_bnet_write_buffer, buffer_u16,	_bnet_ping);
buffer_write(_bnet_write_buffer, buffer_u32,	(_bnet_system_time / 1000));

//If using websocket connection
if(_bnet_is_ws) _bnet_network_send_raw(_bnet_id, _bnet_tcp_socket, _bnet_write_buffer, 7);
else{
	var 
	b = _bnet_buffer_encode(_bnet_id, _bnet_write_buffer, _bnet_mtu, _bnet_connection_type),
	s = array_length_1d(b)-1;
	
	for(var i = 0; i < s; i++){
		network_send_udp_raw(_bnet_udp_socket, _bnet_ip, _bnet_server_udp_port, b[i], buffer_get_size(b[i]));
		
		buffer_delete(b[i]);
	}
}

//if(_bnet_debug)show_debug_message(_bnet_time_stamp + " BNET DEBUGGER:: PING TO SERVER SENT");
alarm[1] = _bnet_ping_rate;