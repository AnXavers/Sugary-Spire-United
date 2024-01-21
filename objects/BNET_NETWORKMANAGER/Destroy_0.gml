/// @description CLEANS UP DATA
if(_bnet_type == undefined) exit;

var __bnet_size = ds_list_size(_bnet_decoder_list);

for(var i = 0; i < __bnet_size; i++) buffer_delete(array_get(_bnet_decoder_list[| i], 0));

ds_list_destroy(_bnet_decoder_list);

while(!ds_list_empty(global._bnet_callback_list)) _bnet_callback_cleanup();

if(_bnet_type == "server"){
	ds_map_destroy(_bnet_server_local_client_map);
	
	__bnet_size = ds_list_size(_bnet_server_client_list);
	
	for(var i = 0; i < __bnet_size; i++) ds_map_destroy(_bnet_server_client_list[| i]);	
	
	ds_list_destroy(_bnet_server_client_list);
	
	ds_map_destroy(_bnet_server_client_map);
	
	var __bnet_room;
	
	__bnet_size = ds_list_size(_bnet_server_room_list);
	
	for(var i = 0; i < __bnet_size; i++){
		//Destroy all room data structures.
		__bnet_room = _bnet_server_room_list[| i];
		
		ds_list_destroy(__bnet_room[? "client_list"]);
		ds_map_destroy(__bnet_room[? "client_map"]);
	
		ds_list_destroy(__bnet_room[? "instance_list"]);
		ds_map_destroy(__bnet_room[? "instance_map"]);
									
		ds_map_destroy(__bnet_room);	
	}
	
	ds_list_destroy(_bnet_server_room_list);
	
	ds_map_destroy(_bnet_server_room_map);
	
	var __bnet_namespace;
	
	__bnet_size = ds_list_size(_bnet_server_namespace_list);
	
	for(var i = 0; i < __bnet_size; i++){
		//Destroy all namespace data structures.
		__bnet_namespace = _bnet_server_namespace_list[| i];
		
		ds_map_destroy(__bnet_namespace[? "client_map"]);
		
		ds_list_destroy(__bnet_namespace[? "client_list"]);
		
		ds_map_destroy(__bnet_namespace);
	}
	
	ds_list_destroy(_bnet_server_namespace_list);
	ds_map_destroy(_bnet_server_namespace_map);
	
	ds_map_destroy(_bnet_server_list_map);
}

for(var k = ds_map_find_first(_bnet_lockstep_map); k != undefined; k = ds_map_find_next(_bnet_lockstep_map, k)) buffer_delete(array_get(_bnet_lockstep_map[? k], 1));
		
ds_map_destroy(_bnet_lockstep_map);
		
ds_list_destroy(_bnet_lockstep_instance_list);

_bnet_buffer_cache_destroy();

_bnet_buffer_cache_destroy_(_bnet_buffer_udp_cache_map, _bnet_buffer_udp_cache_list);

buffer_delete(_bnet_write_buffer);

buffer_delete(_bnet_tcp_buffer);
	
network_destroy(_bnet_tcp_socket);

if(_bnet_udp_socket != undefined) network_destroy(_bnet_udp_socket);
	
var 
__bnet_map	= _bnet_info[? "voip"],
__bnet_list	= __bnet_map[? "list"],
__bnet_size = ds_list_size(__bnet_list),
__bnet_snd;
	
for(var i = 0; i < __bnet_size; i += 2;){
	__bnet_snd = __bnet_list[| i];
		
	audio_free_buffer_sound(__bnet_snd);
            
	buffer_delete(__bnet_list[| i+1]);
									
	ds_list_delete(__bnet_list, i+1);
	
	ds_list_delete(__bnet_list, i);
		
	i -= 2;
	
	__bnet_size -= 2;
}

ds_list_destroy(__bnet_list);

buffer_delete(__bnet_map[? "buffer"]);

_bnet_logger("CLEANED UP SUCCESSFULLY");

ds_map_destroy(_bnet_info);