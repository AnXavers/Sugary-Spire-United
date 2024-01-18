/// @function bnet_mongodb_database_create(database_name)
function bnet_mongodb_database_create(argument0) {

	/*  @description					Makes a request to create a database with provided name. Note database is created after 
										pushing data to it. 
									
										WARNING!!! Beware of congestion. This function is taxing on server, use sparsely.
	*/

	/// @param {string} database_name	Name for database.

	/// @call-back						mongodb_database_created

	/// @error-codes					"600"

#region #Example
	/*
		bnet_mongodb_database_create("pvp");
	*/
#endregion

	with(BNET_NETWORKMANAGER.id){
		if(_bnet_type == 1){
			buffer_seek(_bnet_write_buffer,  buffer_seek_start, 0);
		
			buffer_write(_bnet_write_buffer, buffer_s8,		6);
			buffer_write(_bnet_write_buffer, buffer_s8,		0);
			buffer_write(_bnet_write_buffer, buffer_s8,		0);
			buffer_write(_bnet_write_buffer, buffer_string, argument0);
						
			_bnet_network_send_raw(_bnet_id, _bnet_tcp_socket, _bnet_write_buffer, buffer_tell(_bnet_write_buffer));
		
			_bnet_logger("DATABASE CREATE REQUEST SENT");
		}
	}


}
