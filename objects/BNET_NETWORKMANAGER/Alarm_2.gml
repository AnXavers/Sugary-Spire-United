/// @description UDP CACHE LIST CLEAN UP
var 
__bnet_cache	= _bnet_buffer_udp_cache_map,
__bnet_list		= _bnet_buffer_udp_cache_list,
__bnet_size		= ds_list_size(__bnet_list)-1;

repeat(__bnet_size){

	//Retrieve tag of first buffer within list.
	var 
	__bnet_buffer_map	= __bnet_list[| 0],
	__bnet_buffer_list  = __bnet_buffer_map[? "list"],
	__bnet_size_		= ds_list_size(__bnet_buffer_list);

	for(var i = 0; i < __bnet_size_; i++) buffer_delete(__bnet_buffer_list[| i]);

	ds_map_delete(__bnet_cache, __bnet_buffer_map[? "tag"]);
	
	ds_map_destroy(__bnet_buffer_map);
	
	ds_list_destroy(__bnet_buffer_list);

	ds_list_delete(__bnet_list, 0);
	
	//Stop iterating once 2% of previous stored buffers are deleted.
	if(ds_list_size(__bnet_list) <= (__bnet_size * .2)) break;
}

alarm[2] = max(_bnet_congestion_thresh - _bnet_ping, fps * .5, 1);