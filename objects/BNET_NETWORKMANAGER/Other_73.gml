/// @description DO NOT EDIT VOIP SETTINGS
var 
__bnet_length	= async_load[? "data_len"],
__bnet_map		= _bnet_info[? "voip"];
	
if (__bnet_map[? "channel"] == async_load[? "channel_index"]){
	//Copy audio buffer into voip buffer at last position.
	buffer_copy(async_load[? "buffer_id"], 0, __bnet_length, __bnet_map[? "buffer"], __bnet_map[? "length"]);
	
	__bnet_map[? "length"] += __bnet_length;
}