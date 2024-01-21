function _bnet_callback() {
	if(!instance_exists(BNET_NETWORKMANAGER)){
		if(!variable_global_exists("_bnet_callback_list")) return -1;
		else{
			if(global._bnet_callback_list == undefined) return global._bnet_callback_prev;
			var 
			__bnet_list			= global._bnet_callback_list,
		
			__bnet_call_back	= (ds_list_size(__bnet_list) > 0? array_get(__bnet_list[| 0], 0): -1);
		
			if(__bnet_call_back == bnet_callbacks.disconnected || __bnet_call_back == bnet_callbacks.server_destroyed || __bnet_call_back == bnet_callbacks.server_shut_downed){
			
				while(!ds_list_empty(__bnet_list)) _bnet_callback_cleanup();
			
				ds_list_destroy(__bnet_list);
			
				global._bnet_callback_list = undefined;
			}
		
			global._bnet_callback_prev = __bnet_call_back;
		
			return __bnet_call_back;
		}
	}else return (ds_list_size(global._bnet_callback_list) > 0? array_get(global._bnet_callback_list[| 0], 0): -1);


}
