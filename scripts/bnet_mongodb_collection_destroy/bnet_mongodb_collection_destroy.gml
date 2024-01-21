/// @function bnet_mongodb_collection_destroy(database_name, collection_name)
function bnet_mongodb_collection_destroy(argument0, argument1) {

	/*  @description						Request to destroy a collection from specified database.

											WARNING!!! Beware of congestion. This function is taxing on server, use sparsely.
	*/

	/// @param {string} database_name		Database name which to destroy the collection in.
	/// @param {string} collection_name		Name of collection to destroy.

	/// @call-back							mongodb_collection_destroyed

	/// @error-codes						"606", "607"

#region #Example
	/*
		bnet_mongodb_collection_destroy("pvp", "leaderboards");
	*/
#endregion

	with(BNET_NETWORKMANAGER.id){
		if(_bnet_type == 1){
			buffer_seek(_bnet_write_buffer,  buffer_seek_start, 0);
		
			buffer_write(_bnet_write_buffer, buffer_s8,		6);
			buffer_write(_bnet_write_buffer, buffer_s8,		1);
			buffer_write(_bnet_write_buffer, buffer_s8,		2);
			buffer_write(_bnet_write_buffer, buffer_string, argument0);
			buffer_write(_bnet_write_buffer, buffer_string, argument1);
		
			_bnet_network_send_raw(_bnet_id, _bnet_tcp_socket, _bnet_write_buffer, buffer_tell(_bnet_write_buffer));
		
			_bnet_logger("COLLECTION DESTROY REQUEST SENT");
		}
	}


}
