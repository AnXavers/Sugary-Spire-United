/// @function bnet_mongodb_database_get(database_name)
function bnet_mongodb_database_get(argument0) {

	/*  @description					Makes a request to get a database, or databases.
									
										WARNING!!! Beware of congestion. This function is taxing on server, use sparsely.
	*/

	/// @param {string} database_name	Name of database, or enter "" to get all associated with cluster.

	/// @call-back						mongodb_databases_loaded

	/// @error-codes					"601"

#region #Example
	/*
		bnet_mongodb_database_get("pvp");
	
		case bnet_callbacks.mongodb_databases_loaded:
			var name = bnet_callback_load[? "name"];
		
			//Will return only one but decided to loop.
			if(name == "pvp"){
				var 
				list = bnet_callback_load[? "databases"],
				size = ds_list_size(list),
				map,
				copy;
		
				for(var i = 0; i < size; i++){
					map = list[| i];
			
					if(map != -1){
						copy = ds_map_create();
				
						ds_map_copy(copy, map);
				
						ds_list_add(database, copy);
					}
				}
			}
		break;
	*/
#endregion

	with(BNET_NETWORKMANAGER.id){
		if(_bnet_type == 1){
			buffer_seek(_bnet_write_buffer,  buffer_seek_start, 0);
		
			buffer_write(_bnet_write_buffer, buffer_s8,		6);
			buffer_write(_bnet_write_buffer, buffer_s8,		0);
			buffer_write(_bnet_write_buffer, buffer_s8,		1);
			buffer_write(_bnet_write_buffer, buffer_string, argument0);
						
			_bnet_network_send_raw(_bnet_id, _bnet_tcp_socket, _bnet_write_buffer, buffer_tell(_bnet_write_buffer));
		
			_bnet_logger("GET DATABASE(S) REQUEST SENT");
		}
	}


}
