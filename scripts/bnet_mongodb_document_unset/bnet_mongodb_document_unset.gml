/// @function bnet_mongodb_document_unset(database_name, collection_name, document_id, key)
function bnet_mongodb_document_unset(argument0, argument1, argument2, argument3) {

	/*  @description						Request to delete a key within a document.

											WARNING!!! Beware of congestion. This function is taxing on server, use sparsely.
	*/

	/// @param {string} database_name		Database name which the collection is within.
	/// @param {string} collection_name		Collection name which the document is within.
	/// @param {string} document_id			Document name to delete the key in.
	/// @param {string} key					Key to delete from document.

	/// @call-back							mongodb_document_updated

	/// @error-codes						"617", "618", "619"

#region Example
	/*
		bnet_mongodb_document_unset("pvp", "leaderboards", "k/d", bnet("id"));
	*/
#endregion

	with(BNET_NETWORKMANAGER.id){
		if(_bnet_type == 1){
			buffer_seek(_bnet_write_buffer,  buffer_seek_start, 0);
		
			buffer_write(_bnet_write_buffer, buffer_s8,		6);
			buffer_write(_bnet_write_buffer, buffer_s8,		2);
			buffer_write(_bnet_write_buffer, buffer_s8,		3);
			buffer_write(_bnet_write_buffer, buffer_string, argument0);
			buffer_write(_bnet_write_buffer, buffer_string, argument1);
			buffer_write(_bnet_write_buffer, buffer_string, argument2);
			buffer_write(_bnet_write_buffer, buffer_string, argument3);
						
			_bnet_network_send_raw(_bnet_id, _bnet_tcp_socket, _bnet_write_buffer, buffer_tell(_bnet_write_buffer));
		
			_bnet_logger("DOCUMENT UNSET KEY REQUEST SENT");
		}
	}


}
