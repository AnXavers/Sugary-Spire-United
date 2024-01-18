/// @function bnet_mongodb_database_destroy(database_name)
function bnet_mongodb_database_destroy(argument0) {

	/*  @description					Makes a request to destroy a database with the provided name.
									
										WARNING!!! Beware of congestion. This function is taxing on server, use sparsely.
	*/

	/// @param {string} database_name	Name of database.

	/// @call-back						mongodb_database_destroyed

	/// @error-codes					"602"

#region #Example
	/*
		bnet_mongodb_database_destroy("pvp");
	*/
#endregion

	with(BNET_NETWORKMANAGER.id){
		if(_bnet_type == 1){
			buffer_seek(_bnet_write_buffer,  buffer_seek_start, 0);
		
			buffer_write(_bnet_write_buffer, buffer_s8,		6);
			buffer_write(_bnet_write_buffer, buffer_s8,		0);
			buffer_write(_bnet_write_buffer, buffer_s8,		2);
			buffer_write(_bnet_write_buffer, buffer_string, argument0);
						
			_bnet_network_send_raw(_bnet_id, _bnet_tcp_socket, _bnet_write_buffer, buffer_tell(_bnet_write_buffer));
		
			_bnet_logger("DATABASE DESTROY REQUEST SENT");
		}
	}


}
