function _bnet_room_cleanup(argument0) {
	var ///@param map

	var 
	__bnet_room = argument0,
	__bnet_list = __bnet_room[? "client_list"],
	__bnet_size = ds_list_size(__bnet_list);

	for(var i = 0; i < __bnet_size; i++) ds_map_set(__bnet_list[| i], "room", undefined);

	ds_list_delete(_bnet_server_room_list, ds_list_find_index(_bnet_server_room_list, __bnet_room));

	ds_map_delete(_bnet_server_room_map, __bnet_room[? "id"]);

	ds_map_delete(_bnet_server_list_map, __bnet_room[? "id"]);
									
	ds_list_destroy(__bnet_list);
	ds_map_destroy(__bnet_room[? "client_map"]);
									
	ds_list_destroy(__bnet_room[? "instance_list"]);
	ds_map_destroy(__bnet_room[? "instance_map"]);
									
	ds_map_destroy(__bnet_room);


}
