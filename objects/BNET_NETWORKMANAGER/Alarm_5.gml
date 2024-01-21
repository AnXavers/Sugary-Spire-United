/// @description SERVER TERMINATED
if(_bnet_type == 0){
	instance_destroy();
	
	_bnet_callback_push(bnet_callbacks.server_destroyed);
}else _bnet_callback_push(bnet_callbacks.server_shut_downed);