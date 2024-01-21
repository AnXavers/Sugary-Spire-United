function _bnet_callback_cleanup() {
	//Callback clean up
	if(global._bnet_callback_list != undefined && !ds_list_empty(global._bnet_callback_list)){
		var 
		__bnet_callback	= global._bnet_callback_list[| 0],
		__bnet_map		= __bnet_callback[1];
	
		switch(__bnet_callback[0]){
			case bnet_callbacks.server_created:
			case bnet_callbacks.connected:
				var 
				__bnet_list = __bnet_map[? "client_list"],
			
				__bnet_size = ds_list_size(__bnet_list);
			
				for(var i = 0; i < __bnet_size; i++) ds_map_destroy(__bnet_list[| i]);	
			
				ds_list_destroy(__bnet_list);
			
				ds_map_destroy(__bnet_map[? "client_map"]);
			break;
		
			case bnet_callbacks.room_joined:
				var __bnet_list = __bnet_map[? "client_list"];
			
				repeat(2){
					var __bnet_size = ds_list_size(__bnet_list);
				
					for(var i = 0; i < __bnet_size; i++) ds_map_destroy(__bnet_list[| i]);
			
					ds_list_destroy(__bnet_list);
				
					__bnet_list = __bnet_map[? "instance_list"];
				}
			
				ds_map_destroy(__bnet_map[? "client_map"]);
			
				ds_map_destroy(__bnet_map[? "instance_map"]);
			break;
		
			case bnet_callbacks.instance_updated:
				buffer_delete(__bnet_map[? "buffer"]);
			break;
		
			case bnet_callbacks.namespace_updated:
				var 
				__bnet_list = __bnet_map[? "client_list"],
				__bnet_size = ds_list_size(__bnet_list);
			
				for(var i = 0; i < __bnet_size; i++) ds_map_destroy(__bnet_list[| i]);
		
				ds_list_destroy(__bnet_list);
			
				ds_map_destroy(__bnet_map[? "client_map"]);
			break;
		
			case bnet_callbacks.mongodb_databases_loaded:
				var 
				__bnet_list = __bnet_map[? "databases"],
				__bnet_size = ds_list_size(__bnet_list);
			
				for(var i = 0; i < __bnet_size; i++) if(__bnet_list[| i] != -1) ds_map_destroy(__bnet_list[| i]);
			
				ds_list_destroy(__bnet_list);
			break;
		
			case bnet_callbacks.mongodb_collections_loaded:
				var 
				__bnet_list = __bnet_map[? "collections"],
				__bnet_size = ds_list_size(__bnet_list);
			
				for(var i = 0; i < __bnet_size; i++) if(__bnet_list[| i] != -1) ds_map_destroy(__bnet_list[| i]);
			
				ds_list_destroy(__bnet_list);
			break;
		
			case bnet_callbacks.mongodb_documents_loaded:
				var 
				__bnet_list = __bnet_map[? "documents"],
				__bnet_size = ds_list_size(__bnet_list);
			
				for(var i = 0; i < __bnet_size; i++) if(__bnet_list[| i] != -1) ds_map_destroy(__bnet_list[| i]);
			
				ds_list_destroy(__bnet_list);
			break;
		}
	
		if(__bnet_map != -1) ds_map_destroy(__bnet_map);
	
		ds_list_delete(global._bnet_callback_list, 0);
	
		global._bnet_callback_load = (ds_list_size(global._bnet_callback_list) > 0? array_get(global._bnet_callback_list[| 0], 1): -1);
	}


}
