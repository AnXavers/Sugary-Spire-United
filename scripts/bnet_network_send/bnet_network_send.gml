/// @function bnet_network_send(client_id, buffer_id, size)
function bnet_network_send(argument0, argument1, argument2) {

	/*  @description				A wrapper function to send a bnet encoded tcp packet to a client.
								
									You must create a script named 'bnetOnMessage(bufferid)'
									receiving 1 argument being bufferid. 
								
									The received buffer will contain a bnet header, and will be deleted automatically,
									thus if buffer is needed after the step it's suggested to copy the buffer
									without the header bytes.
								
									NOTE THERE MUST BE NO UNUSED / LEADING BYTES. BEHIND THE SCENE BNET
									LOOPS UNTIL ALL DATA READ.
	*/

	/// @param {string}	client_id	The client's id to send the buffer to.
	/// @param {real}	buffer_id	The id of the buffer to get the data from.
	/// @param {real}	size		The size (in bytes) of the data.

	/// @event						"bnetOnMessage"

	/// @error-codes				"006"

#region Example
	/*
		var buffer = buffer_create(12, buffer_fixed, 1);
	
		buffer_write(buffer, buffer_string, "hello world");
	
		bnet_network_send("client_id", buffer, 12);
	
		buffer_delete(buffer);
	*/
#endregion

	with(BNET_NETWORKMANAGER.id){
		var
		__bnet_id		= argument0,
		__bnet_size		= argument2,
		__bnet_new_size = __bnet_size + 2 + string_length(__bnet_id),
		__bnet_buffer	= buffer_create(__bnet_new_size, buffer_fixed, 1);

		buffer_write(__bnet_buffer, buffer_s8,		-6);//5
		buffer_write(__bnet_buffer, buffer_string,	__bnet_id);//8

		buffer_copy(argument1, 0, __bnet_size, __bnet_buffer, __bnet_new_size - __bnet_size);
	
		if(_bnet_type == 1){
			_bnet_network_send_raw(_bnet_id, _bnet_tcp_socket, __bnet_buffer, __bnet_new_size);
		
			_bnet_logger("TCP PACKET SENT");
		}else{
			var c = _bnet_server_client_map[? __bnet_id];
							
			if(c != undefined){
				if(c == _bnet_server_local_client_map){
					_bnet_logger("received a packet");
				
					buffer_seek(__bnet_buffer, buffer_seek_start, 2 + string_length(__bnet_id));
				
					script_execute(asset_get_index("bnetOnMessage"), __bnet_buffer);
				}else{
					_bnet_network_send_raw(_bnet_id, c[? "socket"], __bnet_buffer, __bnet_new_size);
												
					_bnet_logger("TCP PACKET SENT");
				}
			}else{
				_bnet_sendError(_bnet_tcp_socket, _bnet_write_buffer, "006");
								
				_bnet_logger_client(_bnet_id, "SENT A PACKET TO A CLIENT FAILED. INVALID CLIENT ID");
			}
		}
	
		buffer_delete(__bnet_buffer);
	}


}
