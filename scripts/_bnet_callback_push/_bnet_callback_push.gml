/// @param callback
/// @param data
function _bnet_callback_push() {

	var __bnet_map = (argument_count > 1? argument[1]: -1);

	if(global._bnet_callback_load == -1) global._bnet_callback_load = __bnet_map;

	ds_list_add(global._bnet_callback_list, [argument[0], __bnet_map]);

	//Had to add for order of operations after GMS2 v2.2. 
	global._bnet_callback_cleanup_ = true;


}
