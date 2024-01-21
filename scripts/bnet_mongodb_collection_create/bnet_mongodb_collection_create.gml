/// @function bnet_mongodb_collection_create(database_name, collection_name)
function bnet_mongodb_collection_create(argument0, argument1) {

	/*  @description						Request to create a collection within specified database.

											WARNING!!! Beware of congestion. This function is taxing on server, use sparsely.
	*/

	/// @param {string} database_name		Database name which to create the collection in.
	/// @param {string} collection_name		Name to assign to collection.

	/// @call-back							mongodb_collection_created

	/// @error-codes						"603"

#region #Example
	/*
		bnet_mongodb_collection_create("pvp", "leaderboards");
	*/
#endregion

	with(BNET_NETWORKMANAGER.id){
		if(_bnet_type == 1){
			buffer_seek(_bnet_write_buffer,  buffer_seek_start, 0);
		
			buffer_write(_bnet_write_buffer, buffer_s8,		6);
			buffer_write(_bnet_write_buffer, buffer_s8,		1);
			buffer_write(_bnet_write_buffer, buffer_s8,		0);
			buffer_write(_bnet_write_buffer, buffer_string, argument0);
			buffer_write(_bnet_write_buffer, buffer_string, argument1);
						
			_bnet_network_send_raw(_bnet_id, _bnet_tcp_socket, _bnet_write_buffer, buffer_tell(_bnet_write_buffer));
		
			_bnet_logger("COLLECTION CREATE REQUEST SENT");
		}
	}


}
