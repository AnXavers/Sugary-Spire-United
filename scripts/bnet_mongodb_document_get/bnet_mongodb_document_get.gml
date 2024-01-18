/// @function bnet_mongodb_document_get(database_name, collection_name, document_name)
function bnet_mongodb_document_get(argument0, argument1, argument2) {

	/*  @description						Request to load a document(s) from specified database, and collection.

											WARNING!!! Beware of congestion. This function is taxing on server, use sparsely.
	*/

	/// @param {string} database_name		Database name which the collection is within.
	/// @param {string} collection_name		Collection name to pull the document from.
	/// @param {string} document_name		Document name to get. Enter "" to get all.

	/// @call-back							mongodb_documents_loaded

	/// @error-codes						"611", "612", "613"

#region Example
	/*
		bnet_mongodb_document_get("pvp", "leaderboards", "k/d");
	
		case bnet_callbacks.mongodb_documents_loaded:
			var
			database_name	= bnet_callback_load[? "database_name"],
			collection_name = bnet_callback_load[? "collection_name"],
			document_key	= bnet_callback_load[? "document_key"];
		
			if(database_name == "pvp" && collection_name == "leaderboards" && document_key == "k/d"){
				var 
				list = bnet_callback_load[? "documents"],
				size = ds_list_size(list),
				map,
				copy;
		
				for(var i = 0; i < size; i++){
					map = list[| i];
			
					if(map != -1){
						copy = ds_map_create();
				
						ds_map_copy(copy, map);
				
						ds_list_add(kill_deaths, copy);
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
			buffer_write(_bnet_write_buffer, buffer_s8,		2);
			buffer_write(_bnet_write_buffer, buffer_s8,		1);
			buffer_write(_bnet_write_buffer, buffer_string, argument0);
			buffer_write(_bnet_write_buffer, buffer_string, argument1);
			buffer_write(_bnet_write_buffer, buffer_string, argument2);
		
			_bnet_network_send_raw(_bnet_id, _bnet_tcp_socket, _bnet_write_buffer, buffer_tell(_bnet_write_buffer));
		
			_bnet_logger("DOCUMENT GET REQUEST SENT");
		}
	}


}
