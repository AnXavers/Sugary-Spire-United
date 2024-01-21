/// @function _bnet_logger_client(client_id, message)
function _bnet_logger_client(argument0, argument1) {

	/*  @description	A simple debug message display.

	*/

	/// @param {ds_map} client_id
	/// @param {string} message

	_bnet_logger("{ "+argument0 +" } "+ argument1);


}
