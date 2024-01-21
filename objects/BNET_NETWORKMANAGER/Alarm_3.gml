/// @description PACKET BUILDER AND SEND RATE
//Set alarm accordingly.
alarm[3]			= max(_bnet_ping * .05, 1);

while(!ds_list_empty(_bnet_buffer_cache_list)){
	var 
	__bnet_offset	= 0,
	__bnet_port		= undefined,
	__bnet_socket	= undefined,
	__bnet_ip		= undefined,
	__bnet_is_tcp	= undefined;
	
	//Combine as much packets as possible before sending to same destination.
	while(__bnet_offset < 65527){
		
		//Get the first buffer data within list.
		var 
		__bnet_data		= _bnet_buffer_cache_list[| 0],
		
		//Get buffer.
		__bnet_buffer_	= __bnet_data[0],
		
		__bnet_size		= buffer_get_size(__bnet_buffer_);
		
		//If socket isnt set already, set it.
		__bnet_socket	= (__bnet_socket == undefined?	__bnet_data[1]: __bnet_socket);
		
		__bnet_is_tcp	= (__bnet_is_tcp == noone?		__bnet_data[2]: __bnet_is_tcp);
		
		//If ip isnt set already, set it.
		__bnet_ip		= (__bnet_ip == undefined?		__bnet_data[3]: __bnet_ip);
		
		//If port isnt set already, set it.
		__bnet_port		= (__bnet_port == undefined?	__bnet_data[4]: __bnet_port);
		
		//Copy listed buffer into new buffer.
		buffer_copy(__bnet_buffer_, 0, __bnet_size,		_bnet_write_buffer, __bnet_offset);
		
		//Set buffer new size.
		__bnet_offset += __bnet_size;
		
		//Delete listed buffer.
		buffer_delete(__bnet_buffer_);
		
		ds_list_delete(_bnet_buffer_cache_list, 0);
		
		//If list empty stop loop.
		if(ds_list_empty(_bnet_buffer_cache_list)) break;
		
		//Get next buffer.
		__bnet_data = _bnet_buffer_cache_list[| 0];
		
		//If potential size surpasses mtu or buffer isn't being sent to same destination stop loop.
		if(__bnet_offset + buffer_get_size(__bnet_data[0]) > 65535 || __bnet_data[1] != __bnet_socket || __bnet_data[2] != __bnet_is_tcp || ((__bnet_ip != undefined && __bnet_data[3] != __bnet_ip) || (__bnet_port != noone && __bnet_data[4] != __bnet_port))) break;
	}
	
	buffer_resize(_bnet_write_buffer, __bnet_offset);
	
	network_send_udp_raw(__bnet_socket, __bnet_ip, __bnet_port, _bnet_write_buffer, __bnet_offset);
	
	//If the last sent data exceeds 60000 in size, set the next send rate to 6% of game speed to allow possible next chunc to send.
	if(__bnet_offset > 60000){
		alarm[3] = _bnet_ping * .1;
		
		break;
	}
}