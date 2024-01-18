/// @function bnet_mongodb_collection_get(database_name, collection_name)
function bnet_mongodb_collection_get(argument0, argument1) {

	/*  @description						Request to load a collection(s) from specified database.
										
											WARNING!!! Beware of congestion. This function is taxing on server, use sparsely.
	*/

	/// @param {string} database_name		Database name which to create the collection in.
	/// @param {string} collection_name		Name of collection to pull. Enter "" to pull all.

	/// @call-back							mongodb_collections_loaded

	/// @error-codes						"604", "605"

#region #Example
	/*
		bnet_mongodb_collection_get("pvp", "leaderboards");
	
		case bnet_callbacks.mongodb_collections_loaded:
			var
			database_name	= bnet_callback_load[? "database_name"],
			collection_name = bnet_callback_load[? "collection_name"];
		
			if(database_name == "pvp" && collection_name == "leaderboards"){
				var
				list = bnet_callback_load[? "collections"],
				size = ds_list_size(list),
				map,
				copy;
		
				for(var i = 0; i < size; i++){
					map = list[| i];
			
					if(map != -1){
						copy = ds_map_create();
				
						ds_map_copy(copy, map);
				
						ds_list_add(leaderboards, copy);
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
			buffer_write(_bnet_write_buffer, buffer_s8,		1);
			buffer_write(_bnet_write_buffer, buffer_s8,		1);
			buffer_write(_bnet_write_buffer, buffer_string, argument0);
			buffer_write(_bnet_write_buffer, buffer_string, argument1);
						
			_bnet_network_send_raw(_bnet_id, _bnet_tcp_socket, _bnet_write_buffer, buffer_tell(_bnet_write_buffer));
		
			_bnet_logger("COLLECTION GET REQUEST SENT");
		}
	}


}
