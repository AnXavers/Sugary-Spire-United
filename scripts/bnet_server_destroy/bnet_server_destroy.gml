/// @function bnet_server_destroy(*timer)
function bnet_server_destroy() {

	/*  @description			Proper way to destroy bnet p2p server. Can also notify clients when server is being destroyed, 
								by setting a number grater than 0, or to cancel by setting a number less than or equals to zero.
	*/

	/// @param {real} *timer	OPTIONAL Timer to set countdown too. DEFAULT: 1

	/// @call-back				server_shutting_down, server_shut_downed, server_destroyed	

#region Example
	/*
		bnet_server_destroy(180);
	*/
#endregion

	with(BNET_NETWORKMANAGER.id){
		if(_bnet_type == 0){
			var __bnet_alarm	= argument_count > 0? argument[0]: 1;
	
			alarm[5]			= __bnet_alarm;
	
			//BROADCAST A MESSAGE TO EVERY CLIENT THAT THE SERVER IS BEING DESTROYED.
			buffer_resize(_bnet_write_buffer, 6);
		
			buffer_seek(_bnet_write_buffer, buffer_seek_start, 0);
	
			buffer_write(_bnet_write_buffer, buffer_s8,		0);
			buffer_write(_bnet_write_buffer, buffer_s8,		-2);
			buffer_write(_bnet_write_buffer, buffer_u32,	__bnet_alarm);
		
			_bnet_network_send_broadcast_tcp(_bnet_server_client_list, _bnet_write_buffer, undefined);
	
			_bnet_logger("Server set to destroy");
		
			var __bnet_event_map		= ds_map_create();
			__bnet_event_map[? "timer"] = __bnet_alarm;
		
			_bnet_callback_push(bnet_callbacks.server_shutting_down, __bnet_event_map);
		}
	}


}
