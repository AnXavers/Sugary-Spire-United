for (var k = ds_map_find_first(global.room_client_map); !is_undefined(k); k = ds_map_find_next(global.room_client_map, k)) {
	ds_map_destroy(global.room_client_map[? k]);
}
			
ds_map_destroy(global.room_client_map);
			
for (var k = ds_map_find_first(global.client_map); !is_undefined(k); k = ds_map_find_next(global.client_map, k)) {
	ds_map_destroy(global.client_map[? k]);
}
			
ds_map_destroy(global.client_map);
			
for (var k = ds_map_find_first(global.instance_map); !is_undefined(k); k = ds_map_find_next(global.instance_map, k)) {
	var inst = global.instance_map[? k];
				
	if(instance_exists(inst)) instance_destroy(inst);
}
			
ds_map_destroy(global.instance_map);

for(var i = 0; i < ds_list_size(global.messages); i++){
	ds_map_destroy(global.messages[| i]);	
}
			
ds_list_destroy(global.messages);

ds_grid_destroy(depth_grid);