/// @function bnet_network_send_broadcast_tcp(list, buffer_id, size)
function bnet_network_send_broadcast_tcp(argument0, argument1, argument2) {

	/*  @description				A wrapper function to broadcast a bnet encoded tcp packet to a group of clients.
								
									You must create a script named 'bnetOnMessage(bufferid)'
									receiving 1 argument being bufferid. 
								
									The received buffer will contain a bnet header, and will be deleted automatically,
									thus if buffer is needed after the step it's suggested to copy the buffer
									without the header bytes.
								
									NOTE THERE MUST BE NO UNUSED / LEADING BYTES. BEHIND THE SCENE BNET
									LOOPS UNTIL ALL DATA READ.
	*/

	/// @param {string} list		List to broadcast too. bnet("server"), bnet("room"), "namespace_id". Default: bnet("server").
	/// @param {real}	buffer_id	The id of the buffer to get the data from.
	/// @param {real}	size		The size (in bytes) of the data.

	/// @event						"bnetOnMessage"

	/// @error-codes				"007"

#region Example
	/*
		var buffer = buffer_create(12, buffer_fixed, 1);
	
		buffer_write(buffer, buffer_string, "hello world");
	
		bnet_network_send_broadcast_tcp(bnet("server"), buffer, 12);
	
		buffer_delete(buffer);
	*/
#endregion

	with(BNET_NETWORKMANAGER.id){
		var
		__bnet_id		= argument0,
		__bnet_size		= argument2,
		__bnet_new_size = __bnet_size + 2 + string_length(__bnet_id),
		__bnet_buffer	= buffer_create(__bnet_new_size, buffer_fixed, 1);

		buffer_write(__bnet_buffer, buffer_s8,		-7);//5
		buffer_write(__bnet_buffer, buffer_string,	__bnet_id);//8

		buffer_copy(argument1, 0, __bnet_size, __bnet_buffer, __bnet_new_size - __bnet_size);
	
		if(_bnet_type == 1){
			_bnet_network_send_raw(_bnet_id, _bnet_tcp_socket, __bnet_buffer, __bnet_new_size);
		
			_bnet_logger("TCP PACKET BROADCASTED");
		}else{
			var __bnet_list	= _bnet_server_list_map[? __bnet_id];
		
			if(__bnet_list != undefined){
				if(_bnet_network_send_broadcast_tcp(__bnet_list, __bnet_buffer, undefined)){
					_bnet_logger("received a packet");
				
					buffer_seek(__bnet_buffer, buffer_seek_start, 2 + string_length(__bnet_id));
				
					script_execute(asset_get_index("bnetOnMessage"), __bnet_buffer);
				}
			}else{
				_bnet_sendError(_bnet_tcp_socket, _bnet_write_buffer, "007");
								
				_bnet_logger_client(_bnet_id, "FAILED TO BROADCAST A TCP PACKET. INVALID LIST ID");
			}
		}
	
		buffer_delete(__bnet_buffer);
	}


}
