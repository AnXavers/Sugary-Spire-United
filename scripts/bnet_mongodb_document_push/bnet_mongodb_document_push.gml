/// @function bnet_mongodb_document_push(database_name, collection_name, document_id, key, value)
function bnet_mongodb_document_push(argument0, argument1, argument2, argument3, argument4) {

	/*  @description						Request to push to an array within a document. If key not found, one will 
											be created.
										
											WARNING!!! Beware of congestion. This function is taxing on server, use sparsely.
	*/

	/// @param {string} database_name		Database name which the collection is within.
	/// @param {string} collection_name		Collection name which the document is within.
	/// @param {string} document_id			Document _id to put the key, value pair in.
	/// @param {string} key					Key to add to document.
	/// @param {array} value				Value to assign to key. Note will be sent as a string.

	/// @call-back							mongodb_document_updated

	/// @error-codes						"620", "621", "622"

#region Example
	/*
		bnet_mongodb_document_push("pvp", "leaderboards", "k/d", bnet("id"), string([kills, death]));
	*/
#endregion

	with(BNET_NETWORKMANAGER.id){
		if(_bnet_type == 1){
			buffer_seek(_bnet_write_buffer,  buffer_seek_start, 0);
		
			buffer_write(_bnet_write_buffer, buffer_s8,		6);
			buffer_write(_bnet_write_buffer, buffer_s8,		2);
			buffer_write(_bnet_write_buffer, buffer_s8,		4);
			buffer_write(_bnet_write_buffer, buffer_string, argument0);
			buffer_write(_bnet_write_buffer, buffer_string, argument1);
			buffer_write(_bnet_write_buffer, buffer_string, argument2);
			buffer_write(_bnet_write_buffer, buffer_string, argument3);
			buffer_write(_bnet_write_buffer, buffer_string, argument4);
		
			_bnet_network_send_raw(_bnet_id, _bnet_tcp_socket, _bnet_write_buffer, buffer_tell(_bnet_write_buffer));
		
			_bnet_logger("DOCUMENT PUSH REQUEST SENT");
		}
	}


}