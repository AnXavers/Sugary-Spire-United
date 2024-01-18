/// @function bnet_mongodb_document_destroy(database_name, collection_name, document_id)
function bnet_mongodb_document_destroy(argument0, argument1, argument2) {

	/*  @description						Request to destroy a document from specified database, and collection.

											WARNING!!! Beware of congestion. This function is taxing on server, use sparsely.
	*/

	/// @param {string} database_name		Database name which the collection is within.
	/// @param {string} collection_name		Collection name which the document is within.
	/// @param {string} document_id			Document _id to destroy.

	/// @call-back							mongodb_document_destroyed

	/// @error-codes						"626", "627", "628"

#region Example
	/*
		bnet_mongodb_document_destroy("pvp", "leaderboards", "k/d");
	*/
#endregion

	with(BNET_NETWORKMANAGER.id){
		if(_bnet_type == 1){
			buffer_seek(_bnet_write_buffer,  buffer_seek_start, 0);
		
			buffer_write(_bnet_write_buffer, buffer_s8,		6);
			buffer_write(_bnet_write_buffer, buffer_s8,		2);
			buffer_write(_bnet_write_buffer, buffer_s8,		6);
			buffer_write(_bnet_write_buffer, buffer_string, argument0);
			buffer_write(_bnet_write_buffer, buffer_string, argument1);
			buffer_write(_bnet_write_buffer, buffer_string, argument2);
						
			_bnet_network_send_raw(_bnet_id, _bnet_tcp_socket, _bnet_write_buffer, buffer_tell(_bnet_write_buffer));
		
			_bnet_logger("DOCUMENT DESTROY REQUEST SENT");
		}
	}


}
